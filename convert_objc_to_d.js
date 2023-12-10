
const fs = require('fs');

function convertObjCToD(objcCode) {
    // Remove documentation and API_AVAILABLE expressions
    objcCode = objcCode.replace(/\/\*[\s\S]*?\*\//g, '');
    objcCode = objcCode.replace(/API_AVAILABLE\(.+\)/g, '');

    // Convert typedefs
    objcCode = objcCode.replace(/typedef\s+(\w+)\s*\(\^(\w+)\)\s*(.+);/g,
                                'alias $2 = $1 function $3;');
    // Convert enums
    objcCode = objcCode.replace(/typedef NS_ENUM\((\w+),\s*(\w+)\)\s*\{([^}]+)\}\s*;/g,
                                'enum $2 : $1 { $3 }');

    // Convert classes and protocols
    let matches = [...objcCode.matchAll(/@(interface|protocol)\s+(\w+)(\s*:\s*\w+)?\s*\{[\s\S]*\}([\s\S]*)@end/g)];
    for (let match of matches) {
        let [fullMatch, kind, name, inheritance, body] = match;
        console.log(body)
        let converted = convertClassOrProtocol(kind, name, inheritance, body);
        objcCode = objcCode.replace(fullMatch, converted);
    }

    return objcCode;
}



function convertClassOrProtocol(kind, name, inheritance, body) {
    let converted = kind === 'interface' ? `class ${name}` : `interface ${name}`;
    converted += ' {\n';
    if (inheritance) {
        converted += `    mixin ObjcExtend!${inheritance.trim().slice(1)};\n`;
    }

    // Convert properties
    converted += convertProperties(body);

    // Convert methods
    converted += convertMethods(body);

    converted += '}\n';
    return converted;
}

function convertProperties(body) {
    let properties = [...body.matchAll(/@property\s*\(([^)]+)\)\s*(\w+\s*\*?)(\w+);/g)];
    return properties.map(prop => {
        let [fullProp, attributes, type, name] = prop;
        let readonly = attributes.includes('readonly');
        let getterCustomMatch = attributes.match(/getter\s*=\s*(\w+)/);
        let getterName = getterCustomMatch ? getterCustomMatch[1] : name;

        // Convert generic types
        type = convertTypeToD(type);

        // Define the getter
        let convertedProp = `    @selector("${name}")`+'\n';
        convertedProp+= `    ${type} ${getterName}();`+'\n';

        // Define the setter if not readonly
        if (!readonly) {
            convertedProp += '\n';
            convertedProp += `    @selector("set${name.charAt(0).toUpperCase()}${name.slice(1)}:")`+'\n';
            convertedProp += `    ${type} ${name}(${type});\n`;
        }

        return convertedProp;
    }).join('');
}

function convertTypeToD(type) 
{
    type = type.replace(/<([^>]+)>/g, '!($1)');
    type = type.replace('NSArray', 'NSArray_');
    return type;
}

function convertMethods(body) {
    let methods = [...body.matchAll(/-\s*\(([^)]+)\)\s*([^;]+);/g)];
    return methods.map(method => {
        let [fullMethod, returnType, rest] = method;
        let selectorName, methodName, paramNames;
        if(rest.includes(':'))
        {
            const params = [...rest.matchAll(/(\w+:)\s*\(([\s\S]*?)\)/g)];
            // Add @selector when having arguments
            methodName = params[0][1].slice(0, -1);
            selectorName = params.map((p) => p[1]).join('');
            paramNames = params.map((p) => 
            {
                let type = convertTypeToD(p[2]);
                if(type.includes("__nullable"))
                {
                    type = type.replaceAll("__nullable", "");
                    return type+" "+p[1].slice(0, -1)+" = null";
                }
                return type + " " + p[1].slice(0, -1);
            }).join(", ");
        }
        else
        {
            selectorName = methodName = rest.trim();
            paramNames = "";
        }
        return `    @selector("${selectorName}")\n    ${convertTypeToD(returnType)} ${methodName.trim()}(${paramNames});\n`;
    }).join('');
}

function main(inputFilePath, outputFilePath) {
    let objcCode = fs.readFileSync(inputFilePath, 'utf8');
    let convertedDCode = convertObjCToD(objcCode);
    fs.writeFileSync(outputFilePath, convertedDCode);
}

if (process.argv.length !== 4) {
    console.log('Usage: node convert_objc_to_d.js <input_file> <output_file>');
    process.exit(1);
}

main(process.argv[2], process.argv[3]);

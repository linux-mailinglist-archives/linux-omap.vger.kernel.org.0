Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3693B3FF4C8
	for <lists+linux-omap@lfdr.de>; Thu,  2 Sep 2021 22:19:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243511AbhIBUUt (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 2 Sep 2021 16:20:49 -0400
Received: from mail-ot1-f52.google.com ([209.85.210.52]:46671 "EHLO
        mail-ot1-f52.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231321AbhIBUUs (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Thu, 2 Sep 2021 16:20:48 -0400
Received: by mail-ot1-f52.google.com with SMTP id v33-20020a0568300921b0290517cd06302dso4079540ott.13;
        Thu, 02 Sep 2021 13:19:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=Zc4Bka7Z27BGz/FwvwBav+oDcWlZ03tv3Oc8DdWUZWI=;
        b=HHbWATxTs5k98teAMuG8uT+YyQeXZr+kfQ26OAXFXn+1jnpA8plgzjlW8e2GtoMf0F
         0hh2T++G42nq18G7FO1qo1FF+60E2uDmVdygQ3MY84yFdJnUp7WTQ6bn3rv8RnmWBnLS
         7acMvrKBDbN4EXLEF0vnT59EwkDjF09cTPvyxrDFjy9BTm96XqVWBeaqoKBas+FnEDnY
         3rgfESGddWPTpWelF5z+9MyIQhNOz0VrKtBKT7n2wvM9ReAQA9CFMvnjHzA7PLGdtovD
         Qr1HB8qH0/csDVhbw9G+kaa4uqLWoNZgNWtYeEDYxlUFSA7/x9ZHlP9Wbz0lbquCMjOU
         7I1g==
X-Gm-Message-State: AOAM533ovryQj4aGTyMj1Jc1jI5vBnyXK/MAnayAYa/XawOUUr9Or7Xp
        L790/+8DreYlWZ4SNnbm7g==
X-Google-Smtp-Source: ABdhPJw04aku2y1a3SMsnpZ4nOCM6NowBUS6YDQcqSvrA7ax/OabLLpjd1UAk6sQK81rJWoJ0YGwIQ==
X-Received: by 2002:a9d:705d:: with SMTP id x29mr53896otj.260.1630613989387;
        Thu, 02 Sep 2021 13:19:49 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net. [66.90.148.213])
        by smtp.gmail.com with ESMTPSA id c7sm536107otm.27.2021.09.02.13.19.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Sep 2021 13:19:48 -0700 (PDT)
Received: (nullmailer pid 1341550 invoked by uid 1000);
        Thu, 02 Sep 2021 20:19:47 -0000
Date:   Thu, 2 Sep 2021 15:19:47 -0500
From:   Rob Herring <robh@kernel.org>
To:     Roger Quadros <rogerq@kernel.org>
Cc:     tony@atomide.com, krzysztof.kozlowski@canonical.com,
        miquel.raynal@bootlin.com, nm@ti.com, lokeshvutla@ti.com,
        devicetree@vger.kernel.org, linux-mtd@lists.infradead.org,
        linux-omap@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/6] dt-bindings: memory-controllers: ti,gpmc: Convert
 to yaml
Message-ID: <YTEx44lPKf0jaIU3@robh.at.kernel.org>
References: <20210902095609.16583-1-rogerq@kernel.org>
 <20210902095609.16583-3-rogerq@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210902095609.16583-3-rogerq@kernel.org>
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Thu, Sep 02, 2021 at 12:56:05PM +0300, Roger Quadros wrote:
> Convert omap-gpmc.txt to ti,gpmc.yaml.
> 
> Signed-off-by: Roger Quadros <rogerq@kernel.org>
> ---
>  .../bindings/memory-controllers/omap-gpmc.txt | 157 --------
>  .../bindings/memory-controllers/ti,gpmc.yaml  | 364 ++++++++++++++++++
>  .../devicetree/bindings/mtd/gpmc-nand.txt     |   2 +-
>  .../devicetree/bindings/mtd/gpmc-nor.txt      |   4 +-
>  .../devicetree/bindings/mtd/gpmc-onenand.txt  |   2 +-
>  .../devicetree/bindings/net/gpmc-eth.txt      |   4 +-
>  6 files changed, 370 insertions(+), 163 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/memory-controllers/omap-gpmc.txt
>  create mode 100644 Documentation/devicetree/bindings/memory-controllers/ti,gpmc.yaml

Also, please install yamllint and fix all the warnings:

../Documentation/devicetree/bindings/memory-controllers/ti,gpmc.yaml:97:6: [warning] wrong indentation: expected 4 but found 5 (indentation)                                                                                                      
../Documentation/devicetree/bindings/memory-controllers/ti,gpmc.yaml:135:9: [warning] wrong indentation: expected 10 but found 8 (indentation)                                                                                                    
../Documentation/devicetree/bindings/memory-controllers/ti,gpmc.yaml:190:27: [warning] too many spaces after colon (colons)                                                                                                                       
../Documentation/devicetree/bindings/memory-controllers/ti,gpmc.yaml:193:26: [warning] too many spaces after colon (colons)                                                                                                                       
../Documentation/devicetree/bindings/memory-controllers/ti,gpmc.yaml:199:23: [warning] too many spaces after colon (colons)                                                                                                                       
../Documentation/devicetree/bindings/memory-controllers/ti,gpmc.yaml:202:34: [warning] too many spaces after colon (colons)                                                                                                                       
../Documentation/devicetree/bindings/memory-controllers/ti,gpmc.yaml:205:32: [warning] too many spaces after colon (colons)                                                                                                                       
../Documentation/devicetree/bindings/memory-controllers/ti,gpmc.yaml:208:32: [warning] too many spaces after colon (colons)                                                                                                                       
../Documentation/devicetree/bindings/memory-controllers/ti,gpmc.yaml:211:26: [warning] too many spaces after colon (colons)                                                                                                                       
../Documentation/devicetree/bindings/memory-controllers/ti,gpmc.yaml:214:23: [warning] too many spaces after colon (colons)                                                                                                                       
../Documentation/devicetree/bindings/memory-controllers/ti,gpmc.yaml:217:26: [warning] too many spaces after colon (colons)                                                                                                                       
../Documentation/devicetree/bindings/memory-controllers/ti,gpmc.yaml:220:25: [warning] too many spaces after colon (colons)                                                                                                                       
../Documentation/devicetree/bindings/memory-controllers/ti,gpmc.yaml:226:28: [warning] too many spaces after colon (colons)                                                                                                                       
../Documentation/devicetree/bindings/memory-controllers/ti,gpmc.yaml:229:29: [warning] too many spaces after colon (colons)                                                                                                                       
../Documentation/devicetree/bindings/memory-controllers/ti,gpmc.yaml:242:29: [warning] too many spaces after colon (colons)
../Documentation/devicetree/bindings/memory-controllers/ti,gpmc.yaml:245:29: [warning] too many spaces after colon (colons)
../Documentation/devicetree/bindings/memory-controllers/ti,gpmc.yaml:248:22: [warning] too many spaces after colon (colons)
../Documentation/devicetree/bindings/memory-controllers/ti,gpmc.yaml:270:25: [warning] too many spaces after colon (colons)
../Documentation/devicetree/bindings/memory-controllers/ti,gpmc.yaml:274:27: [warning] too many spaces after colon (colons)
../Documentation/devicetree/bindings/memory-controllers/ti,gpmc.yaml:277:27: [warning] too many spaces after colon (colons)
../Documentation/devicetree/bindings/memory-controllers/ti,gpmc.yaml:280:26: [warning] too many spaces after colon (colons)
../Documentation/devicetree/bindings/memory-controllers/ti,gpmc.yaml:314:25: [warning] too many spaces after colon (colons)
../Documentation/devicetree/bindings/memory-controllers/ti,gpmc.yaml:317:24: [warning] too many spaces after colon (colons)

Rob

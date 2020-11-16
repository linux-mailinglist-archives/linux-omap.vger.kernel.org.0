Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A8EB12B4948
	for <lists+linux-omap@lfdr.de>; Mon, 16 Nov 2020 16:31:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729467AbgKPP2J (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 16 Nov 2020 10:28:09 -0500
Received: from mail-ot1-f66.google.com ([209.85.210.66]:40689 "EHLO
        mail-ot1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728072AbgKPP2J (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Mon, 16 Nov 2020 10:28:09 -0500
Received: by mail-ot1-f66.google.com with SMTP id 79so16335988otc.7;
        Mon, 16 Nov 2020 07:28:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=XsZYCYmCDn2jJNZ3YPhnt3zMmh/GdQ7aiHEvrUSq43E=;
        b=hNDH5pTjpaotURQu3JJwSmdsYV2GdDyH8mIJE/SNo14yoCOAOrBd7CkU2Qe2rv3RWp
         69pl9opM+rHx9CSuY2Jez3V0xdmh6lcCkCE/t+mbecCvWgCVZ3QHuQ/nyURPRwCrg31x
         5tdBdsMcHM7MCbPZCL9J4359pMqJscyXzAxTIaHCRF7F6R0am/Hh+2fMB3tcJq8ZvTz6
         +RrsTuLRAxoaoG9ybk9pTRU5v6P9PuTulJHUhjxWxkNwAcUc4Dso5hpuK8F5aV7TAkEG
         Cd2AbVYYf2o7YOzbKmJx0CV3RPeUap+KBEQuiDaPFVb7IdEyS3UVva9NgFDSw/sL1cQK
         UEIw==
X-Gm-Message-State: AOAM531OHc5+WvZ1e4RyNSPx8Q+bhwPUbEd0dbQCOiizZxxzySUcJ5vl
        T3LtHI2psFIdNbccpgwcSw==
X-Google-Smtp-Source: ABdhPJzMHbevWN3Txhs8HkqBRES+c+YhAfzzJWEZBNY+YW2C4FUgQlCenK/IEH+Wk0swu1Ld4CiQaw==
X-Received: by 2002:a9d:ba3:: with SMTP id 32mr10569511oth.298.1605540486591;
        Mon, 16 Nov 2020 07:28:06 -0800 (PST)
Received: from xps15 (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id 72sm4742110otd.11.2020.11.16.07.28.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2020 07:28:05 -0800 (PST)
Received: (nullmailer pid 1679774 invoked by uid 1000);
        Mon, 16 Nov 2020 15:28:05 -0000
Date:   Mon, 16 Nov 2020 09:28:04 -0600
From:   Rob Herring <robh@kernel.org>
To:     Grzegorz Jaszczyk <grzegorz.jaszczyk@linaro.org>
Cc:     linux-omap@vger.kernel.org, ohad@wizery.com,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        rogerq@ti.com, praneeth@ti.com, s-anna@ti.com,
        bjorn.andersson@linaro.org, mathieu.poirier@linaro.org,
        robh+dt@kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, lee.jones@linaro.org
Subject: Re: [PATCH 1/6] dt-bindings: remoteproc: Add binding doc for PRU
 cores in the PRU-ICSS
Message-ID: <20201116152804.GA1679588@bogus>
References: <20201114084613.13503-1-grzegorz.jaszczyk@linaro.org>
 <20201114084613.13503-2-grzegorz.jaszczyk@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201114084613.13503-2-grzegorz.jaszczyk@linaro.org>
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Sat, 14 Nov 2020 09:46:08 +0100, Grzegorz Jaszczyk wrote:
> From: Suman Anna <s-anna@ti.com>
> 
> The Programmable Real-Time Unit and Industrial Communication Subsystem
> (PRU-ICSS or simply PRUSS) on various TI SoCs consists of dual 32-bit
> RISC cores (Programmable Real-Time Units, or PRUs) for program execution.
> 
> The K3 AM65x amd J721E SoCs have the next generation of the PRU-ICSS IP,
> commonly called ICSSG. The ICSSG IP on AM65x SoCs has two PRU cores,
> two auxiliary custom PRU cores called Real Time Units (RTUs). The K3
> AM65x SR2.0 and J721E SoCs have a revised version of the ICSSG IP, and
> include two additional custom auxiliary PRU cores called Transmit PRUs
> (Tx_PRUs).
> 
> This patch adds the bindings for these PRU cores. The binding covers the
> OMAP architecture SoCs - AM33xx, AM437x and AM57xx; Keystone 2 architecture
> based 66AK2G SoC; and the K3 architecture based SoCs - AM65x and J721E. The
> Davinci based OMAPL138 SoCs will be covered in a future patch.
> 
> Co-developed-by: Roger Quadros <rogerq@ti.com>
> Signed-off-by: Roger Quadros <rogerq@ti.com>
> Signed-off-by: Suman Anna <s-anna@ti.com>
> Signed-off-by: Grzegorz Jaszczyk <grzegorz.jaszczyk@linaro.org>
> ---
>  .../bindings/remoteproc/ti,pru-rproc.yaml     | 214 ++++++++++++++++++
>  1 file changed, 214 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/remoteproc/ti,pru-rproc.yaml
> 


My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:
./Documentation/devicetree/bindings/remoteproc/ti,pru-rproc.yaml:37:6: [warning] wrong indentation: expected 6 but found 5 (indentation)
./Documentation/devicetree/bindings/remoteproc/ti,pru-rproc.yaml:92:2: [warning] wrong indentation: expected 2 but found 1 (indentation)

dtschema/dtc warnings/errors:


See https://patchwork.ozlabs.org/patch/1400241

The base for the patch is generally the last rc1. Any dependencies
should be noted.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit.


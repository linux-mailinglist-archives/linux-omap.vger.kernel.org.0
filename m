Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 412AD2D5EDE
	for <lists+linux-omap@lfdr.de>; Thu, 10 Dec 2020 16:03:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388107AbgLJPA7 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 10 Dec 2020 10:00:59 -0500
Received: from mail-oi1-f194.google.com ([209.85.167.194]:38544 "EHLO
        mail-oi1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729816AbgLJPAu (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Thu, 10 Dec 2020 10:00:50 -0500
Received: by mail-oi1-f194.google.com with SMTP id o25so6014514oie.5;
        Thu, 10 Dec 2020 07:00:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=UVsVIe3suYkFEfD50jET/XIrhdhVHmEbSyKr3t3yUpg=;
        b=MhV6cqzKRcgaBTijnJBo1dE7CEUzr6JsBbJ0x5/xJUssfhiz0F1oe7ONeuzN3bhqYn
         3UWwMRTv/sHG1Z3klmfX3M0Fk+LGzbZhjl1J1PRpw+zWPMask1PbPrZDbFUgzIxRpk0Y
         X4SLjdmcVwWqtSiJnPXdpWGWOSLGHX2ICpk3Qgv5SqXnPVT6nt2h0A4roLEI56wkEu2f
         PWOt+c4dZmVMb4hp2wkzXPc4eiqALu3cxvWM7Vj0zYRfIgkAV/5edMyH2Q7Hhm24aFaE
         qXClRm7I6X2dwfJhU/UM+xuq2FzQgpxb9yESKPsp6mklHV+AupvioSdGAhGeWxHjlWhF
         b8Hg==
X-Gm-Message-State: AOAM530sUN7nWqjAZ//Ga0NbDatBEfbK2rQe1j3bjx2EML2oOo3uL0jZ
        M60ifA4aiXpH/A17HTOVN0piIVRvBA==
X-Google-Smtp-Source: ABdhPJxtjxFO5NRE5uDTlGtuOqlTdZ+z6YyXsCpr2sbIMHkfwWL05oCwLJORR97iFJXMyZ7TuC6Xog==
X-Received: by 2002:a05:6808:685:: with SMTP id k5mr5725138oig.135.1607612409231;
        Thu, 10 Dec 2020 07:00:09 -0800 (PST)
Received: from xps15 (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id r4sm1030551ooa.29.2020.12.10.07.00.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Dec 2020 07:00:08 -0800 (PST)
Received: (nullmailer pid 2499159 invoked by uid 1000);
        Thu, 10 Dec 2020 15:00:07 -0000
Date:   Thu, 10 Dec 2020 09:00:07 -0600
From:   Rob Herring <robh@kernel.org>
To:     Grzegorz Jaszczyk <grzegorz.jaszczyk@linaro.org>
Cc:     praneeth@ti.com, linux-remoteproc@vger.kernel.org,
        bjorn.andersson@linaro.org, rogerq@ti.com, s-anna@ti.com,
        linux-omap@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, ohad@wizery.com,
        lee.jones@linaro.org, linux-arm-kernel@lists.infradead.org,
        robh+dt@kernel.org, mathieu.poirier@linaro.org
Subject: Re: [PATCH v4 1/6] dt-bindings: remoteproc: Add binding doc for PRU
 cores in the PRU-ICSS
Message-ID: <20201210150007.GA2499121@robh.at.kernel.org>
References: <20201208141002.17777-1-grzegorz.jaszczyk@linaro.org>
 <20201208141002.17777-2-grzegorz.jaszczyk@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201208141002.17777-2-grzegorz.jaszczyk@linaro.org>
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Tue, 08 Dec 2020 15:09:57 +0100, Grzegorz Jaszczyk wrote:
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
> v3->v4:
> - no changes
> 
> v2->v3:
> - no changes
> v1->v2:
> - fix below yamllint warnings:
> ./Documentation/devicetree/bindings/remoteproc/ti,pru-rproc.yaml:37:6: [warning] wrong indentation: expected 6 but found 5 (indentation)
> ./Documentation/devicetree/bindings/remoteproc/ti,pru-rproc.yaml:92:2: [warning] wrong indentation: expected 2 but found 1 (indentation)
> ---
>  .../bindings/remoteproc/ti,pru-rproc.yaml     | 214 ++++++++++++++++++
>  1 file changed, 214 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/remoteproc/ti,pru-rproc.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>

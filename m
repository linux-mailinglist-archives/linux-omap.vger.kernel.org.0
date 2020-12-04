Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4D6C32CF05A
	for <lists+linux-omap@lfdr.de>; Fri,  4 Dec 2020 16:07:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727496AbgLDPG7 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 4 Dec 2020 10:06:59 -0500
Received: from fllv0016.ext.ti.com ([198.47.19.142]:55622 "EHLO
        fllv0016.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726635AbgLDPG6 (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Fri, 4 Dec 2020 10:06:58 -0500
Received: from fllv0035.itg.ti.com ([10.64.41.0])
        by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 0B4F5GG6108931;
        Fri, 4 Dec 2020 09:05:16 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1607094316;
        bh=x3QQpVqGD3Chyeor/qyNF9e/Ifi7+TxddtR8br0FcC0=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=beDMLR2F2b0vX4LtEZVKhLWSvvEgIF/zj52w5G0h5t5JqeYKbDvnVdzOGPHyTLDiR
         M8CHn6vinImn2yRgvQn4WG2KMFWfp4OPW1yfSFztRjTIud937SO0kpm2MKlngfadjl
         P0J9fzweeDR2UeHZ7uR52WBE63azojKO7faku3CA=
Received: from DLEE113.ent.ti.com (dlee113.ent.ti.com [157.170.170.24])
        by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 0B4F5G79008358
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Fri, 4 Dec 2020 09:05:16 -0600
Received: from DLEE115.ent.ti.com (157.170.170.26) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Fri, 4 Dec
 2020 09:05:15 -0600
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Fri, 4 Dec 2020 09:05:15 -0600
Received: from [10.250.68.46] (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 0B4F590Z054621;
        Fri, 4 Dec 2020 09:05:10 -0600
Subject: Re: [PATCH v2 0/6] Add a PRU remoteproc driver
To:     Grzegorz Jaszczyk <grzegorz.jaszczyk@linaro.org>,
        <ohad@wizery.com>, <bjorn.andersson@linaro.org>,
        <mathieu.poirier@linaro.org>
CC:     <linux-remoteproc@vger.kernel.org>, <robh+dt@kernel.org>,
        <lee.jones@linaro.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-omap@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <praneeth@ti.com>,
        <rogerq@ti.com>
References: <20201119140850.12268-1-grzegorz.jaszczyk@linaro.org>
From:   Suman Anna <s-anna@ti.com>
Message-ID: <d31a38a2-940c-2ce6-b496-4b4ac2fbe08e@ti.com>
Date:   Fri, 4 Dec 2020 09:05:08 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201119140850.12268-1-grzegorz.jaszczyk@linaro.org>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi Greg,

On 11/19/20 8:08 AM, Grzegorz Jaszczyk wrote:
> Hi All,
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
> This series contains the PRUSS remoteproc driver together with relevant
> dt-binding. This is the 3rd foundation component for PRUSS subsystem, the
> previous two were already merged and can be found under:
> 1) drivers/soc/ti/pruss.c
>    Documentation/devicetree/bindings/soc/ti/ti,pruss.yaml
> 2) drivers/irqchip/irq-pruss-intc.c
>    Documentation/devicetree/bindings/interrupt-controller/ti,pruss-intc.yaml
> 
> The following is a v2 version of the series. Please see the individual patches
> for exact changes in each patch, following are the main changes from v1:
> - Patch #1: fix two yamllint warnings.
> - Patch #2: address Suman comments: minor style improvements and fix for
> 	    optional resource table handling (moved from patch #3).
> - Patch #3: address Suman comment: minor style, comments and trace improvements
> 	    (no functional changes).
> - Patch #4: No changes.
> - Patch #5: Update documentation of pru_rproc_memcpy() function and is_k3 flag.
> - Patch #6: No changes.
> 
> Best regards,
> Grzegorz
> 
> Grzegorz Jaszczyk (1):
>   remoteproc/pru: Add support for PRU specific interrupt configuration
> 
> Suman Anna (5):
>   dt-bindings: remoteproc: Add binding doc for PRU cores in the PRU-ICSS
>   remoteproc/pru: Add a PRU remoteproc driver
>   remoteproc/pru: Add pru-specific debugfs support
>   remoteproc/pru: Add support for various PRU cores on K3 AM65x SoCs
>   remoteproc/pru: Add support for various PRU cores on K3 J721E SoCs

One minor change for v3 when you repost to address Mathieu's comments, can you
please adjust the patch titles to use
"remoteproc: pru:" instead following the latest convention.

Thanks,
Suman

> 
>  .../bindings/remoteproc/ti,pru-rproc.yaml     | 214 +++++
>  drivers/remoteproc/Kconfig                    |  12 +
>  drivers/remoteproc/Makefile                   |   1 +
>  drivers/remoteproc/pru_rproc.c                | 877 ++++++++++++++++++
>  drivers/remoteproc/pru_rproc.h                |  46 +
>  5 files changed, 1150 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/remoteproc/ti,pru-rproc.yaml
>  create mode 100644 drivers/remoteproc/pru_rproc.c
>  create mode 100644 drivers/remoteproc/pru_rproc.h
> 


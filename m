Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 218472D5FD7
	for <lists+linux-omap@lfdr.de>; Thu, 10 Dec 2020 16:36:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2391693AbgLJPeX (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 10 Dec 2020 10:34:23 -0500
Received: from fllv0016.ext.ti.com ([198.47.19.142]:59356 "EHLO
        fllv0016.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2391812AbgLJPeT (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Thu, 10 Dec 2020 10:34:19 -0500
Received: from lelv0266.itg.ti.com ([10.180.67.225])
        by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 0BAFXIAM110543;
        Thu, 10 Dec 2020 09:33:18 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1607614398;
        bh=AeyQGxgu/DbIULyND/4supeqkzfg6gDhQeqZq4ZzO/w=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=npJW6fejpX1XkkxT8PhGAdoGgg6/U9RCGL7brBEyaSDpooeeqUIWacJWYNSJQXD1h
         yaTOpODgZaf6YMrd/epYadpgu+D3x85gUDa50TweRctSwdNsevcvXSh36PLyz6pSAp
         rT46cR0fOikp5ZNh8s2IEGMcKQbZC7FG5NyxVfko=
Received: from DFLE109.ent.ti.com (dfle109.ent.ti.com [10.64.6.30])
        by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 0BAFXIcp080989
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Thu, 10 Dec 2020 09:33:18 -0600
Received: from DFLE111.ent.ti.com (10.64.6.32) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Thu, 10
 Dec 2020 09:30:58 -0600
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE111.ent.ti.com
 (10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Thu, 10 Dec 2020 09:30:58 -0600
Received: from [10.250.38.244] (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 0BAFUwi2110524;
        Thu, 10 Dec 2020 09:30:58 -0600
Subject: Re: [PATCH v4 0/6] Add a PRU remoteproc driver
To:     Grzegorz Jaszczyk <grzegorz.jaszczyk@linaro.org>,
        <ohad@wizery.com>, <bjorn.andersson@linaro.org>,
        <mathieu.poirier@linaro.org>, <robh+dt@kernel.org>
CC:     <linux-remoteproc@vger.kernel.org>, <lee.jones@linaro.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-omap@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <praneeth@ti.com>,
        <rogerq@ti.com>
References: <20201208141002.17777-1-grzegorz.jaszczyk@linaro.org>
From:   Suman Anna <s-anna@ti.com>
Message-ID: <0dc797aa-b938-4a9a-b8cb-ec73508563fd@ti.com>
Date:   Thu, 10 Dec 2020 09:30:58 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201208141002.17777-1-grzegorz.jaszczyk@linaro.org>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi Bjorn,

On 12/8/20 8:09 AM, Grzegorz Jaszczyk wrote:
> Hi All,
> 
> The Programmable Real-Time Unit and Industrial Communication Subsystem
> (PRU-ICSS or simply PRUSS) on various TI SoCs consists of dual 32-bit
> RISC cores (Programmable Real-Time Units, or PRUs) for program execution.
> 
> The K3 AM65x and J721E SoCs have the next generation of the PRU-ICSS IP,
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
> The following is a v4 version of the series. There is only one change
> from v3 [1]:
> - Use sizeof(unsigned int) instead of sizeof(int) for kcalloc in
> pru_handle_intrmap() in patch #3.
> 
> [1] https://patchwork.kernel.org/project/linux-arm-kernel/cover/20201204201807.14716-1-grzegorz.jaszczyk@linaro.org/
> 
> Best regards,
> Grzegorz
> 
> Grzegorz Jaszczyk (1):
>   remoteproc: pru: Add support for PRU specific interrupt configuration
> 
> Suman Anna (5):
>   dt-bindings: remoteproc: Add binding doc for PRU cores in the PRU-ICSS
>   remoteproc: pru: Add a PRU remoteproc driver
>   remoteproc: pru: Add pru-specific debugfs support
>   remoteproc: pru: Add support for various PRU cores on K3 AM65x SoCs
>   remoteproc: pru: Add support for various PRU cores on K3 J721E SoCs

All patches in this series are Reviewed now and we have got the binding ack as
well. Can you please pick this series up for 5.11 if it is not too late?

Thank you,
Suman

> 
>  .../bindings/remoteproc/ti,pru-rproc.yaml     | 214 +++++
>  drivers/remoteproc/Kconfig                    |  12 +
>  drivers/remoteproc/Makefile                   |   1 +
>  drivers/remoteproc/pru_rproc.c                | 875 ++++++++++++++++++
>  drivers/remoteproc/pru_rproc.h                |  46 +
>  5 files changed, 1148 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/remoteproc/ti,pru-rproc.yaml
>  create mode 100644 drivers/remoteproc/pru_rproc.c
>  create mode 100644 drivers/remoteproc/pru_rproc.h
> 


Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DD07124C0C9
	for <lists+linux-omap@lfdr.de>; Thu, 20 Aug 2020 16:44:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726792AbgHTOoi (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 20 Aug 2020 10:44:38 -0400
Received: from lelv0142.ext.ti.com ([198.47.23.249]:32858 "EHLO
        lelv0142.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726852AbgHTOog (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Thu, 20 Aug 2020 10:44:36 -0400
Received: from fllv0034.itg.ti.com ([10.64.40.246])
        by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 07KEhFpl082349;
        Thu, 20 Aug 2020 09:43:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1597934595;
        bh=alKUMzHacRceHiGl20u8VbwQ5t87jtgokFeHaBhYYjI=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=fopCcyd1UmFHdwt3hPtdu1FEJun8NB/dKNp+b5PGYzoCeNCQyo2g0QL4Fa5MZqK9E
         shETrZBf+aGXnlQth6cWi+BQGFSgUA/NUQt02rmN4nbstWIDwC6JT5wPmSSHVO24Fc
         l7QlehzAXCnauTrlwzv8oUpQsTpwnl9uFMueuuD4=
Received: from DFLE115.ent.ti.com (dfle115.ent.ti.com [10.64.6.36])
        by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 07KEhFGG035932
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Thu, 20 Aug 2020 09:43:15 -0500
Received: from DFLE109.ent.ti.com (10.64.6.30) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Thu, 20
 Aug 2020 09:43:14 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Thu, 20 Aug 2020 09:43:14 -0500
Received: from [10.250.32.29] (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 07KEhEia007737;
        Thu, 20 Aug 2020 09:43:14 -0500
Subject: Re: [PATCH 0/6] Add TI PRUSS platform driver
To:     Grzegorz Jaszczyk <grzegorz.jaszczyk@linaro.org>,
        <ssantosh@kernel.org>, Tony Lindgren <tony@atomide.com>
CC:     <santosh.shilimkar@oracle.com>, <robh+dt@kernel.org>,
        <lee.jones@linaro.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-omap@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <praneeth@ti.com>
References: <1596020528-19510-1-git-send-email-grzegorz.jaszczyk@linaro.org>
From:   Suman Anna <s-anna@ti.com>
Message-ID: <12a7fc2a-4c48-655f-daa1-880fd1866fd1@ti.com>
Date:   Thu, 20 Aug 2020 09:43:14 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <1596020528-19510-1-git-send-email-grzegorz.jaszczyk@linaro.org>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi Santosh, Tony,

On 7/29/20 6:02 AM, Grzegorz Jaszczyk wrote:
> Hi,
> 
> The Programmable Real-Time Unit and Industrial Communication Subsystem
> (PRU-ICSS) is present on various TI SoCs. The IP is present on multiple TI SoC
> architecture families including the OMAP architecture SoCs such as AM33xx,
> AM437x and AM57xx; and on a Keystone 2 architecture based 66AK2G SoC. It is also
> present on the Davinci based OMAPL138 SoCs and K3 architecture based AM65x and
> J721E SoCs as well.
> 
> A PRUSS consists of dual 32-bit RISC cores (Programmable Real-Time Units, or
> PRUs), shared RAM, data and instruction RAMs, some internal peripheral modules
> to facilitate industrial communication, and an interrupt controller.
> 
> The programmable nature of the PRUs provide flexibility to implement custom
> peripheral interfaces, fast real-time responses, or specialized data handling.
> The common peripheral modules include the following,
>   - an Ethernet MII_RT module with two MII ports
>   - an MDIO port to control external Ethernet PHYs
>   - an Industrial Ethernet Peripheral (IEP) to manage/generate Industrial
>     Ethernet functions
>   - an Enhanced Capture Module (eCAP)
>   - an Industrial Ethernet Timer with 7/9 capture and 16 compare events
>   - a 16550-compatible UART to support PROFIBUS
>   - Enhanced GPIO with async capture and serial support
> 
> 
> A typical usage scenario would be to load the application firmware into one or
> more of the PRU cores, initialize one or more of the peripherals and perform I/O
> through shared RAM from either a kernel driver or directly from userspace.
> 
> This series contains the PRUSS platform driver. This is the parent driver for
> the entire PRUSS and is used for managing the subsystem level resources like
> various memories and the CFG module.  It is responsible for the creation and
> deletion of the platform devices for the child PRU devices and other child
> devices (like Interrupt Controller, MDIO node and some syscon nodes) so that
> they can be managed by specific platform drivers.
> 
> Grzegorz Jaszczyk (1):
>   dt-bindings: soc: ti: Add TI PRUSS bindings
> 
> Suman Anna (5):
>   soc: ti: pruss: Add a platform driver for PRUSS in TI SoCs
>   soc: ti: pruss: Add support for PRU-ICSSs on AM437x SoCs
>   soc: ti: pruss: Add support for PRU-ICSS subsystems on AM57xx SoCs
>   soc: ti: pruss: Add support for PRU-ICSS subsystems on 66AK2G SoC
>   soc: ti: pruss: enable support for ICSSG subsystems on K3 AM65x SoCs

Do you have any comments on the driver portions of this series before Greg posts
a v2 addressing the binding comments. This is one of the foundation series
towards enabling PRUSS, and is a dependency for the PRU remoteproc driver.

regards
Suman

> 
>  .../devicetree/bindings/soc/ti/ti,pruss.yaml       | 383 +++++++++++++++++++++
>  drivers/soc/ti/Kconfig                             |  11 +
>  drivers/soc/ti/Makefile                            |   1 +
>  drivers/soc/ti/pruss.c                             | 183 ++++++++++
>  include/linux/pruss_driver.h                       |  48 +++
>  5 files changed, 626 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/soc/ti/ti,pruss.yaml
>  create mode 100644 drivers/soc/ti/pruss.c
>  create mode 100644 include/linux/pruss_driver.h
> 


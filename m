Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 36AF43B2031
	for <lists+linux-omap@lfdr.de>; Wed, 23 Jun 2021 20:21:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229849AbhFWSX6 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 23 Jun 2021 14:23:58 -0400
Received: from fllv0015.ext.ti.com ([198.47.19.141]:48116 "EHLO
        fllv0015.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229660AbhFWSX6 (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Wed, 23 Jun 2021 14:23:58 -0400
Received: from fllv0034.itg.ti.com ([10.64.40.246])
        by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 15NILYWr071228;
        Wed, 23 Jun 2021 13:21:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1624472494;
        bh=79nXRFxC4/U2NLmPwObb1ZTUAuFp3i4R/z6Tw5A45Yg=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=gWqDNnWG39W4fdfwRJMo58bET38dQjWrllEIEWkkDFtb77XXaE3nPQ9xS5PEROWg4
         S39mN6HWE1DyVoorriK4jjD1nUYRsv4ayhXEPi8UYLhULzCFwpfI08LrRwJ1e0COks
         IJVxCeltnZH93PbT8W1FvizF9Rpzh+fVzcHGTpmw=
Received: from DFLE109.ent.ti.com (dfle109.ent.ti.com [10.64.6.30])
        by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 15NILYHM100800
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Wed, 23 Jun 2021 13:21:34 -0500
Received: from DFLE111.ent.ti.com (10.64.6.32) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2; Wed, 23
 Jun 2021 13:21:33 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE111.ent.ti.com
 (10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2 via
 Frontend Transport; Wed, 23 Jun 2021 13:21:33 -0500
Received: from [10.250.100.73] (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 15NILU5x017357;
        Wed, 23 Jun 2021 13:21:31 -0500
Subject: Re: [PATCH 2/2] remoteproc: pru: Add support for various PRU cores on
 K3 AM64x SoCs
To:     Suman Anna <s-anna@ti.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh+dt@kernel.org>
CC:     Kishon Vijay Abraham I <kishon@ti.com>,
        Lokesh Vutla <lokeshvutla@ti.com>,
        Vignesh Raghavendra <vigneshr@ti.com>,
        Grzegorz Jaszczyk <grzegorz.jaszczyk@linaro.org>,
        Jan Kiszka <jan.kiszka@siemens.com>,
        <linux-remoteproc@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-omap@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>
References: <20210623173243.7862-1-s-anna@ti.com>
 <20210623173243.7862-3-s-anna@ti.com>
From:   Grygorii Strashko <grygorii.strashko@ti.com>
Message-ID: <ee8e0458-370a-61f8-e348-d718d312cd02@ti.com>
Date:   Wed, 23 Jun 2021 21:21:22 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210623173243.7862-3-s-anna@ti.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org



On 23/06/2021 20:32, Suman Anna wrote:
> The K3 AM64x family of SoCs have a ICSSG IP that is similar to the
> version on AM65x SR2.0 SoCs with some minor differences. The AM64x
> SoCs contain two instances of this newer ICSSG IP. Each ICSSG processor
> subsystem contains 2 primary PRU cores, 2 auxiliary PRU cores called
> RTUs, and 2 new auxiliary cores called Transmit PRUs (Tx_PRUs).
> 
> Enhance the existing PRU remoteproc driver to support all these PRU,
> RTU and Tx_PRU cores by using specific compatibles. The cores have the
> same memory copying limitations as on AM65x, so reuses the custom memcpy
> function within the driver's ELF loader implementation. The initial
> names for the firmware images for each PRU core are retrieved from
> DT nodes, and can be adjusted through sysfs if required.
> 
> Signed-off-by: Suman Anna <s-anna@ti.com>
> ---
>   drivers/remoteproc/pru_rproc.c | 3 +++
>   1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/remoteproc/pru_rproc.c b/drivers/remoteproc/pru_rproc.c
> index e5778e476245..0ecf2675f5eb 100644
> --- a/drivers/remoteproc/pru_rproc.c
> +++ b/drivers/remoteproc/pru_rproc.c
> @@ -894,6 +894,9 @@ static const struct of_device_id pru_rproc_match[] = {
>   	{ .compatible = "ti,j721e-pru",		.data = &k3_pru_data },
>   	{ .compatible = "ti,j721e-rtu",		.data = &k3_rtu_data },
>   	{ .compatible = "ti,j721e-tx-pru",	.data = &k3_tx_pru_data },
> +	{ .compatible = "ti,am642-pru",		.data = &k3_pru_data },
> +	{ .compatible = "ti,am642-rtu",		.data = &k3_rtu_data },
> +	{ .compatible = "ti,am642-tx-pru",	.data = &k3_tx_pru_data },
>   	{},
>   };
>   MODULE_DEVICE_TABLE(of, pru_rproc_match);
> 


Reviewed-by: Grygorii Strashko <grygorii.strashko@ti.com>

-- 
Best regards,
grygorii

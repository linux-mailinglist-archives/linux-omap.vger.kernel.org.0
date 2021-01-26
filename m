Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CEE38303E44
	for <lists+linux-omap@lfdr.de>; Tue, 26 Jan 2021 14:12:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2392220AbhAZNM1 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 26 Jan 2021 08:12:27 -0500
Received: from fllv0016.ext.ti.com ([198.47.19.142]:44150 "EHLO
        fllv0016.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2391394AbhAZNMY (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 26 Jan 2021 08:12:24 -0500
Received: from fllv0034.itg.ti.com ([10.64.40.246])
        by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 10QDBL5Z008181;
        Tue, 26 Jan 2021 07:11:21 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1611666681;
        bh=OIxGDssUznp79R7M1f90S5wax2WpL57deA7dDnGEwwA=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=fe1LJKhE3Y3iZRsBL2BvM55jbAq2kKHkEoGsJlp9dcb9zcJ4QQHXbSC7CNeTdbl3R
         CurkbvL9QmudLAUQJ/+HThQpACqKIqHbFSj0SPBhBr31YVRiU7YUnBsFY5cX4jGOiL
         WpMrI8euqqv50Ze0zUdR1V70MfjOlxlwt8ElDpJc=
Received: from DFLE109.ent.ti.com (dfle109.ent.ti.com [10.64.6.30])
        by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 10QDBLt9106335
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Tue, 26 Jan 2021 07:11:21 -0600
Received: from DFLE113.ent.ti.com (10.64.6.34) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Tue, 26
 Jan 2021 07:11:20 -0600
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Tue, 26 Jan 2021 07:11:21 -0600
Received: from [10.250.100.73] (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 10QDBHET129147;
        Tue, 26 Jan 2021 07:11:18 -0600
Subject: Re: [PATCH v2 2/6] drivers: net: davinci_mdio: Use
 of_device_get_match_data()
To:     Stephen Boyd <swboyd@chromium.org>, Rob Herring <robh@kernel.org>
CC:     <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        "David S. Miller" <davem@davemloft.net>,
        Rob Herring <robh+dt@kernel.org>,
        Frank Rowand <frowand.list@gmail.com>,
        <linux-omap@vger.kernel.org>
References: <20210123034428.2841052-1-swboyd@chromium.org>
 <20210123034428.2841052-3-swboyd@chromium.org>
From:   Grygorii Strashko <grygorii.strashko@ti.com>
Message-ID: <b0ed5a7f-920d-6732-f146-4d184a7c8661@ti.com>
Date:   Tue, 26 Jan 2021 15:11:18 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210123034428.2841052-3-swboyd@chromium.org>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org



On 23/01/2021 05:44, Stephen Boyd wrote:
> Use the more modern API to get the match data out of the of match table.
> This saves some code, lines, and nicely avoids referencing the match
> table when it is undefined with configurations where CONFIG_OF=n.
> 
> Signed-off-by: Stephen Boyd <swboyd@chromium.org>
> Cc: Arnd Bergmann <arnd@arndb.de>
> Cc: Geert Uytterhoeven <geert@linux-m68k.org>
> Cc: Grygorii Strashko <grygorii.strashko@ti.com>
> Cc: "David S. Miller" <davem@davemloft.net>
> Cc: Rob Herring <robh+dt@kernel.org>
> Cc: Frank Rowand <frowand.list@gmail.com>
> Cc: <linux-omap@vger.kernel.org>
> ---
> 
> Please ack so Rob can apply.
> 
>   drivers/net/ethernet/ti/davinci_mdio.c | 12 ++++--------
>   1 file changed, 4 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/net/ethernet/ti/davinci_mdio.c b/drivers/net/ethernet/ti/davinci_mdio.c
> index cfff3d48807a..a4efd5e35158 100644
> --- a/drivers/net/ethernet/ti/davinci_mdio.c
> +++ b/drivers/net/ethernet/ti/davinci_mdio.c
> @@ -358,20 +358,16 @@ static int davinci_mdio_probe(struct platform_device *pdev)
>   	}
>   
>   	if (IS_ENABLED(CONFIG_OF) && dev->of_node) {
> -		const struct of_device_id	*of_id;
> +		const struct davinci_mdio_of_param *of_mdio_data;
>   
>   		ret = davinci_mdio_probe_dt(&data->pdata, pdev);
>   		if (ret)
>   			return ret;
>   		snprintf(data->bus->id, MII_BUS_ID_SIZE, "%s", pdev->name);
>   
> -		of_id = of_match_device(davinci_mdio_of_mtable, &pdev->dev);
> -		if (of_id) {
> -			const struct davinci_mdio_of_param *of_mdio_data;
> -
> -			of_mdio_data = of_id->data;
> -			if (of_mdio_data)
> -				autosuspend_delay_ms =
> +		of_mdio_data = of_device_get_match_data(&pdev->dev);
> +		if (of_mdio_data) {
> +			autosuspend_delay_ms =
>   					of_mdio_data->autosuspend_delay_ms;
>   		}
>   	} else {
> 

Thank you.
Reviewed-by: Grygorii Strashko <grygorii.strashko@ti.com>

-- 
Best regards,
grygorii

Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A64971E24D0
	for <lists+linux-omap@lfdr.de>; Tue, 26 May 2020 17:01:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727978AbgEZPBF (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 26 May 2020 11:01:05 -0400
Received: from rere.qmqm.pl ([91.227.64.183]:50874 "EHLO rere.qmqm.pl"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726939AbgEZPBF (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Tue, 26 May 2020 11:01:05 -0400
Received: from remote.user (localhost [127.0.0.1])
        by rere.qmqm.pl (Postfix) with ESMTPSA id 49Wcbf1BFgz8L;
        Tue, 26 May 2020 17:01:02 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=rere.qmqm.pl; s=1;
        t=1590505262; bh=5eoWOCSdKM+lSnXRhtSkJsDrLufv/HLpEsk0JbM9g6I=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=c+Y9YxlmFWtn2WaNwfZJdGE1DhP5Doxf6E6dQMaz3HGUrCT7wPf8H6l7bkONr4eEj
         UKTqbathgIRAijpN+hDrPq8r9WHRJwUwWdShDzb9yv7Pw651t2VejN9CnXg3itiwX4
         ZQ9d/OOhhw7iQj1EcsmvIVDmqDxC71LZUShUDN2vSldUtXYaafw+kyydg99IVYKwAr
         47JvXlbsojgNiD+RFRlBlVBSvGH2Kn8AoYqQKV1MsNtG1HoUcGWBB7v6GTAgXSuHD3
         PgIGeiPYIQEPFbRnnd/g5dld1PduSYKPaT0FT+9299X9OchhuF3uN0EqQnVWOXDdCN
         S9sThJJOyqlig==
X-Virus-Status: Clean
X-Virus-Scanned: clamav-milter 0.102.2 at mail
Date:   Tue, 26 May 2020 17:01:01 +0200
From:   =?iso-8859-2?Q?Micha=B3_Miros=B3aw?= <mirq-linux@rere.qmqm.pl>
To:     Dmitry Osipenko <digetx@gmail.com>
Cc:     Tony Lindgren <tony@atomide.com>, Lee Jones <lee.jones@linaro.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Zack Pearsall <zpearsall@yahoo.com>,
        linux-tegra@vger.kernel.org, linux-omap@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] mfd: tps65910: Correct power-off programming sequence
Message-ID: <20200526145952.GA2517@qmqm.qmqm.pl>
References: <20200524192643.18207-1-digetx@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-2
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200524192643.18207-1-digetx@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Sun, May 24, 2020 at 10:26:43PM +0300, Dmitry Osipenko wrote:
> This patch fixes system shutdown on a devices that use TPS65910 as a
> system's power controller. In accordance to the TPS65910 datasheet, the
> PMIC's state-machine transitions into the OFF state only when DEV_OFF
> bit of DEVCTRL_REG is set. The ON / SLEEP states also should be cleared,
> otherwise PMIC won't get into a proper state on shutdown. Devices like
> Nexus 7 tablet and Ouya game console are now shutting down properly.

The datasheets of 65910 and 65911 say that ON and SLP bits are cleared
during OFF state. But I guess the hardware might work differently.

[...]
> --- a/drivers/mfd/tps65910.c
> +++ b/drivers/mfd/tps65910.c
> @@ -440,8 +440,13 @@ static void tps65910_power_off(void)
>  			DEVCTRL_PWR_OFF_MASK) < 0)
>  		return;
>  
> -	tps65910_reg_clear_bits(tps65910, TPS65910_DEVCTRL,
> -			DEVCTRL_DEV_ON_MASK);
> +	if (tps65910_reg_clear_bits(tps65910, TPS65910_DEVCTRL,
> +			DEVCTRL_DEV_SLP_MASK) < 0)
> +		return;
> +
> +	tps65910_reg_update_bits(tps65910, TPS65910_DEVCTRL,
> +				 DEVCTRL_DEV_OFF_MASK | DEVCTRL_DEV_ON_MASK,
> +				 DEVCTRL_DEV_OFF_MASK);
>  }

There is tps65910_reg_set_bits() at the start of function. I guess it
doesn't work if your changes are needed. Maybe you can remove it?

I would also include your observations about the chip's behaviour in the
commit message so it doesn't get "fixed" later.

Best Regards,
Micha³ Miros³aw

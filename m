Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 85F1C3872A1
	for <lists+linux-omap@lfdr.de>; Tue, 18 May 2021 08:50:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242314AbhERGvo (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 18 May 2021 02:51:44 -0400
Received: from muru.com ([72.249.23.125]:57008 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S242305AbhERGvn (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Tue, 18 May 2021 02:51:43 -0400
Received: from atomide.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id 3EFD780F5;
        Tue, 18 May 2021 06:50:29 +0000 (UTC)
Date:   Tue, 18 May 2021 09:50:22 +0300
From:   Tony Lindgren <tony@atomide.com>
To:     linux-omap@vger.kernel.org
Cc:     Dave Gerlach <d-gerlach@ti.com>, Faiz Abbas <faiz_abbas@ti.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Grygorii Strashko <grygorii.strashko@ti.com>,
        Keerthy <j-keerthy@ti.com>, Nishanth Menon <nm@ti.com>,
        Suman Anna <s-anna@ti.com>, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] bus: ti-sysc: Fix am335x resume hang for usb otg module
Message-ID: <YKNjrv5shQcjZ4W5@atomide.com>
References: <20210429074533.33355-1-tony@atomide.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210429074533.33355-1-tony@atomide.com>
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

* Tony Lindgren <tony@atomide.com> [210429 10:45]:
> --- a/drivers/bus/ti-sysc.c
> +++ b/drivers/bus/ti-sysc.c
> @@ -1308,7 +1314,23 @@ static int __maybe_unused sysc_noirq_resume(struct device *dev)
>  	    (SYSC_QUIRK_LEGACY_IDLE | SYSC_QUIRK_NO_IDLE))
>  		return 0;
>  
> -	return pm_runtime_force_resume(dev);
> +	/* Only enable module if it was on, or needs to be reinitialized */
> +	if (ddata->needs_resume ||
> +	    ddata->cfg.quirks & SYSC_QUIRK_REINIT_ON_RESUME) {
> +		error = sysc_runtime_resume(dev);
> +		if (error)
> +			dev_warn(dev, "noirq_resume failed: %i\n", error);
> +	}
> +
> +	/* Idle quirky module again if it was not on before suspend */
> +	if (ddata->cfg.quirks & SYSC_QUIRK_REINIT_ON_RESUME &&
> +	    !ddata->needs_resume) {
> +		error = sysc_runtime_suspend(dev);
> +	}
> +
> +	ddata->needs_resume = 0;
> +
> +	return error;
>  }

Best to set this up as a separate function, otherwise cpu_pm won't
be able to use it eventually. I'll send out v2.

Regards,

Tony

Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 614181B9214
	for <lists+linux-omap@lfdr.de>; Sun, 26 Apr 2020 19:26:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726199AbgDZR0d (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Sun, 26 Apr 2020 13:26:33 -0400
Received: from 50-87-157-213.static.tentacle.fi ([213.157.87.50]:34536 "EHLO
        bitmer.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725976AbgDZR0d (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Sun, 26 Apr 2020 13:26:33 -0400
X-Greylist: delayed 1701 seconds by postgrey-1.27 at vger.kernel.org; Sun, 26 Apr 2020 13:26:32 EDT
Received: from 88-114-185-20.elisa-laajakaista.fi ([88.114.185.20] helo=[192.168.1.42])
        by bitmer.com with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.89)
        (envelope-from <jarkko.nikula@bitmer.com>)
        id 1jSkbS-0003UA-FT; Sun, 26 Apr 2020 19:58:02 +0300
Subject: Re: [PATCH] ASoC: ti: remove comparison to bool in
 omap_mcbsp_dai_set_dai_fmt()
To:     Jason Yan <yanaijie@huawei.com>, peter.ujfalusi@ti.com,
        lgirdwood@gmail.com, broonie@kernel.org, perex@perex.cz,
        tiwai@suse.com, rafael.j.wysocki@intel.com, tglx@linutronix.de,
        alsa-devel@alsa-project.org, linux-omap@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20200426094238.23914-1-yanaijie@huawei.com>
From:   Jarkko Nikula <jarkko.nikula@bitmer.com>
Message-ID: <718c9a90-b5ff-f538-1152-c9b585095f3c@bitmer.com>
Date:   Sun, 26 Apr 2020 19:57:59 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200426094238.23914-1-yanaijie@huawei.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On 4/26/20 12:42 PM, Jason Yan wrote:
> Fix the following coccicheck warning:
> 
> sound/soc/ti/omap-mcbsp.c:1188:5-11: WARNING: Comparison to bool
> 
> Signed-off-by: Jason Yan <yanaijie@huawei.com>
> ---
>  sound/soc/ti/omap-mcbsp.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/sound/soc/ti/omap-mcbsp.c b/sound/soc/ti/omap-mcbsp.c
> index 3d41ca2238d4..0348963f4df7 100644
> --- a/sound/soc/ti/omap-mcbsp.c
> +++ b/sound/soc/ti/omap-mcbsp.c
> @@ -1185,7 +1185,7 @@ static int omap_mcbsp_dai_set_dai_fmt(struct snd_soc_dai *cpu_dai,
>  	default:
>  		return -EINVAL;
>  	}
> -	if (inv_fs == true)
> +	if (inv_fs)
>  		regs->pcr0 ^= FSXP | FSRP;
>  
Acked-by: Jarkko Nikula <jarkko.nikula@bitmer.com>

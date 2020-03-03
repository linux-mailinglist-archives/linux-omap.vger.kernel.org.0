Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A3F40178605
	for <lists+linux-omap@lfdr.de>; Tue,  3 Mar 2020 23:56:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728200AbgCCW4o (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 3 Mar 2020 17:56:44 -0500
Received: from mail-pl1-f193.google.com ([209.85.214.193]:34183 "EHLO
        mail-pl1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727942AbgCCW4n (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 3 Mar 2020 17:56:43 -0500
Received: by mail-pl1-f193.google.com with SMTP id j7so97216plt.1
        for <linux-omap@vger.kernel.org>; Tue, 03 Mar 2020 14:56:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=i6kpogp9bxrLw7A3jcVS9T1o1PQC08WdktCFke64Jzw=;
        b=qBx14dYtavLY/4KbnpXE3WBfas6G8ozp3z3JSwbIOEsfsRCLtaHp2RyY4DwcGYS32Y
         +ojmhvcLz4f70TrvCojtqwq6aswQiqryZqbi2jAbXHBzNWTWYaveDqEcrQ5IecaXT5UZ
         FbRuLLS0+uDci32R3QHQVDf8/9bTvVi0BoCaztH+1MDy2aok6Jpjn+p2wAzrM42bXH7j
         s7f3PLqk6xUg8YYOWhQ8KEeaTmBNwzOKkLduWkjeTFT6BQIjPixFuoGPG/1Q0JuVzJzv
         2w7JbYThZLaMJwMJd6IlSpp+eI0WA0flw9SYu6TkPiHaYnVZlSms9hFEGbL2T7ynbQJv
         kieQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=i6kpogp9bxrLw7A3jcVS9T1o1PQC08WdktCFke64Jzw=;
        b=tAwVW0cqKxcjMsWfg3p1PMb6F8GBUbpB8Ns0M06SVj6y/YHr6v/aXcbddUwvQCdYi3
         n3C0gVW9fQbLg2cZA/ffGzUr6puDa2yGL2R97maUjJuGzoImdpLtk4fbRBMgEQvrTKKy
         cG/oNP+WiO5LieRsvYgLg6MV3vhXIIIxcVmSy7lnJJudDoqeoxPH78HUc0TO0fpIa7NO
         tIqICMAxRlyUG3nqIZpdk+gHJIQ/CQSscrWd2Igje/+XMVUMdxWKwNA7LAm3aJK9FBa0
         LFlUq/S2e2SlxvLV1zJmfseCLEShOcwZHU+gNSl7eOlkJbUl54WUlBat67BreJzypbMH
         /RdA==
X-Gm-Message-State: ANhLgQ2RQOJ2Ym4OMTw689fTZE94eBMtjl0olQbxUJA5FYINYGDT+X9v
        28IQDrJeyhNgCaZZKJyKEnetiA==
X-Google-Smtp-Source: ADFU+vtQmzqE7QX4VKsuZYUzxGTrlpmS1U6Y07/os795RX+gaORo/uPB5E9+2e24r6epyqEilswE7A==
X-Received: by 2002:a17:902:9a84:: with SMTP id w4mr176363plp.21.1583276201061;
        Tue, 03 Mar 2020 14:56:41 -0800 (PST)
Received: from xps15 (S0106002369de4dac.cg.shawcable.net. [68.147.8.254])
        by smtp.gmail.com with ESMTPSA id d1sm17598719pfc.3.2020.03.03.14.56.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Mar 2020 14:56:40 -0800 (PST)
Date:   Tue, 3 Mar 2020 15:56:38 -0700
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     Tero Kristo <t-kristo@ti.com>
Cc:     bjorn.andersson@linaro.org, ohad@wizery.com,
        linux-remoteproc@vger.kernel.org, afd@ti.com, s-anna@ti.com,
        linux-kernel@vger.kernel.org, linux-omap@vger.kernel.org
Subject: Re: [PATCHv7 03/15] remoteproc/omap: Add a sanity check for DSP boot
 address alignment
Message-ID: <20200303225638.GB8197@xps15>
References: <20200221101936.16833-1-t-kristo@ti.com>
 <20200221101936.16833-4-t-kristo@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200221101936.16833-4-t-kristo@ti.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Fri, Feb 21, 2020 at 12:19:24PM +0200, Tero Kristo wrote:
> From: Suman Anna <s-anna@ti.com>
> 
> The DSP remote processors on OMAP SoCs require a boot register to
> be programmed with a boot address, and this boot address needs to
> be on a 1KB boundary. The current code is simply masking the boot
> address appropriately without performing any sanity checks before
> releasing the resets. An unaligned boot address results in an
> undefined execution behavior and can result in various bus errors
> like MMU Faults or L3 NoC errors. Such errors are hard to debug and
> can be easily avoided by adding a sanity check for the alignment
> before booting a DSP remote processor.
> 
> Signed-off-by: Suman Anna <s-anna@ti.com>
> Signed-off-by: Tero Kristo <t-kristo@ti.com>
> Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

Acked-by: Mathieu Poirier <mathieu.poirier@linaro.org>

> ---
> v7:
>   - minor kerneldoc update (added return value details for
>     omap_rproc_write_dsp_boot_addr)
> 
>  drivers/remoteproc/omap_remoteproc.c | 20 +++++++++++++++++---
>  1 file changed, 17 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/remoteproc/omap_remoteproc.c b/drivers/remoteproc/omap_remoteproc.c
> index d47d5ded651a..64b559caadff 100644
> --- a/drivers/remoteproc/omap_remoteproc.c
> +++ b/drivers/remoteproc/omap_remoteproc.c
> @@ -121,14 +121,25 @@ static void omap_rproc_kick(struct rproc *rproc, int vqid)
>   * @rproc: handle of a remote processor
>   *
>   * Set boot address for a supported DSP remote processor.
> + *
> + * Return: 0 on success, or -EINVAL if boot address is not aligned properly
>   */
> -static void omap_rproc_write_dsp_boot_addr(struct rproc *rproc)
> +static int omap_rproc_write_dsp_boot_addr(struct rproc *rproc)
>  {
> +	struct device *dev = rproc->dev.parent;
>  	struct omap_rproc *oproc = rproc->priv;
>  	struct omap_rproc_boot_data *bdata = oproc->boot_data;
>  	u32 offset = bdata->boot_reg;
>  
> +	if (rproc->bootaddr & (SZ_1K - 1)) {
> +		dev_err(dev, "invalid boot address 0x%x, must be aligned on a 1KB boundary\n",
> +			rproc->bootaddr);
> +		return -EINVAL;
> +	}
> +
>  	regmap_write(bdata->syscon, offset, rproc->bootaddr);
> +
> +	return 0;
>  }
>  
>  /*
> @@ -145,8 +156,11 @@ static int omap_rproc_start(struct rproc *rproc)
>  	int ret;
>  	struct mbox_client *client = &oproc->client;
>  
> -	if (oproc->boot_data)
> -		omap_rproc_write_dsp_boot_addr(rproc);
> +	if (oproc->boot_data) {
> +		ret = omap_rproc_write_dsp_boot_addr(rproc);
> +		if (ret)
> +			return ret;
> +	}
>  
>  	client->dev = dev;
>  	client->tx_done = NULL;
> -- 
> 2.17.1
> 
> --
> Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki. Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki

Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2784D2C817F
	for <lists+linux-omap@lfdr.de>; Mon, 30 Nov 2020 10:56:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726325AbgK3Jzt (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 30 Nov 2020 04:55:49 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33026 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726249AbgK3Jzt (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Mon, 30 Nov 2020 04:55:49 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 40CF3C0613CF
        for <linux-omap@vger.kernel.org>; Mon, 30 Nov 2020 01:55:09 -0800 (PST)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 6C63A97E;
        Mon, 30 Nov 2020 10:55:06 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1606730106;
        bh=SgPLaAniu/ca8Wzi0b5aQYspmxtkhpGE9sbuYDJNmsU=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=guVnAwZFChTxTQrmX/CNDT4wSwO6i/3mWuuY9OWhEmdLliXgYehTut5XQx7bkH1Kv
         FlUoQOt9SCI3WSvDFRR6jBh555nIB1Vik4rtkGnX1gxSrGIoSpv460cjyjwCKah8vN
         2kiFagnAAD+MzWMj73QL7hPHbz1M8lK7DjvsZyVI=
Date:   Mon, 30 Nov 2020 11:54:58 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Tomi Valkeinen <tomi.valkeinen@ti.com>
Cc:     Sebastian Reichel <sre@kernel.org>,
        Nikhil Devshatwar <nikhil.nd@ti.com>,
        linux-omap@vger.kernel.org, dri-devel@lists.freedesktop.org,
        Sekhar Nori <nsekhar@ti.com>, Tony Lindgren <tony@atomide.com>,
        hns@goldelico.com
Subject: Re: [PATCH v4 58/80] drm/omap: pll: fix iteration loop check
Message-ID: <20201130095458.GJ4141@pendragon.ideasonboard.com>
References: <20201124124538.660710-1-tomi.valkeinen@ti.com>
 <20201124124538.660710-59-tomi.valkeinen@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20201124124538.660710-59-tomi.valkeinen@ti.com>
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi Tomi,

Thank you for the patch.

On Tue, Nov 24, 2020 at 02:45:16PM +0200, Tomi Valkeinen wrote:
> If the PLL calc function is given bad parameters, n_start/m_start may be
> higher than n_stop/m_stop, which leads to the loops iterating through
> the whole u32 number space.
> 
> Fix this by failing early on such cases.
> 
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ti.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  drivers/gpu/drm/omapdrm/dss/pll.c | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/drivers/gpu/drm/omapdrm/dss/pll.c b/drivers/gpu/drm/omapdrm/dss/pll.c
> index 1212f3cc52d1..12926218c436 100644
> --- a/drivers/gpu/drm/omapdrm/dss/pll.c
> +++ b/drivers/gpu/drm/omapdrm/dss/pll.c
> @@ -222,6 +222,9 @@ bool dss_pll_calc_a(const struct dss_pll *pll, unsigned long clkin,
>  	n_stop = min((unsigned)(clkin / fint_hw_min), hw->n_max);
>  	n_inc = 1;
>  
> +	if (n_start > n_stop)
> +		return false;
> +
>  	if (hw->errata_i886) {
>  		swap(n_start, n_stop);
>  		n_inc = -1;
> @@ -239,6 +242,9 @@ bool dss_pll_calc_a(const struct dss_pll *pll, unsigned long clkin,
>  				hw->m_max);
>  		m_inc = 1;
>  
> +		if (m_start > m_stop)
> +			continue;
> +
>  		if (hw->errata_i886) {
>  			swap(m_start, m_stop);
>  			m_inc = -1;

-- 
Regards,

Laurent Pinchart

Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 283F01ADF7B
	for <lists+linux-omap@lfdr.de>; Fri, 17 Apr 2020 16:11:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730929AbgDQOIJ (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 17 Apr 2020 10:08:09 -0400
Received: from mailout2.w1.samsung.com ([210.118.77.12]:58217 "EHLO
        mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730917AbgDQOII (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Fri, 17 Apr 2020 10:08:08 -0400
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
        by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id 20200417140807euoutp0248d682808025e18bd8d76198b592c35a~GoJaL9R4P1553015530euoutp02q
        for <linux-omap@vger.kernel.org>; Fri, 17 Apr 2020 14:08:07 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com 20200417140807euoutp0248d682808025e18bd8d76198b592c35a~GoJaL9R4P1553015530euoutp02q
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1587132487;
        bh=rQFb332w/W0vE9IwL+r/49dQjXVVZeqdXoTwrmYqvUk=;
        h=From:Subject:To:Cc:Date:In-Reply-To:References:From;
        b=LG9mimc4wly/iYgEWIIGXjAdADAsAOJzgEMQsJziFym6ruUo0PHGXfgkXDVyo20Ac
         vKx6vktGA5aWZ/hmVSfqZkXsIxI4MCy9fWr+szXhR5JivlJQWZmWcOpgFuxwqwLLl1
         U+D3Xo5DVVXfZm/USDSeLCcDPjKB5+3vaXDMdwm0=
Received: from eusmges2new.samsung.com (unknown [203.254.199.244]) by
        eucas1p1.samsung.com (KnoxPortal) with ESMTP id
        20200417140806eucas1p197d0cc3dd5c32cf78e85d3e8abec3bd1~GoJZ_-6o11490114901eucas1p1H;
        Fri, 17 Apr 2020 14:08:06 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
        eusmges2new.samsung.com (EUCPMTA) with SMTP id 52.FF.60679.648B99E5; Fri, 17
        Apr 2020 15:08:06 +0100 (BST)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
        eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
        20200417140806eucas1p2f8b9146788f9d6713d758833a8e1ba88~GoJZrwpPA1570815708eucas1p2N;
        Fri, 17 Apr 2020 14:08:06 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
        eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
        20200417140806eusmtrp113e0403ba063812da1635defd08dadb3~GoJZrKlIl2264522645eusmtrp1G;
        Fri, 17 Apr 2020 14:08:06 +0000 (GMT)
X-AuditID: cbfec7f4-0cbff7000001ed07-f7-5e99b846d592
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
        eusmgms1.samsung.com (EUCPMTA) with SMTP id 1D.C2.08375.648B99E5; Fri, 17
        Apr 2020 15:08:06 +0100 (BST)
Received: from [106.120.51.71] (unknown [106.120.51.71]) by
        eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
        20200417140806eusmtip22d2e41fe87a4aa1ac1d362d1fdcb3be0~GoJZPHMNo2022020220eusmtip2f;
        Fri, 17 Apr 2020 14:08:06 +0000 (GMT)
From:   Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Subject: Re: [PATCH -next] omapfb/dss: remove unused varible
 'venc_config_pal_bdghi'
To:     YueHaibing <yuehaibing@huawei.com>
Cc:     allison@lohutok.net, linux-omap@vger.kernel.org,
        linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-kernel@vger.kernel.org
Message-ID: <ef8cf200-4bcd-1a53-abcc-65feba6c11fa@samsung.com>
Date:   Fri, 17 Apr 2020 16:08:05 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
        Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20200415132350.33088-1-yuehaibing@huawei.com>
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrIKsWRmVeSWpSXmKPExsWy7djPc7puO2bGGfxdbW6x8sQ/FosrX9+z
        WZzo+8BqcXnXHDaL2Uv6WSzufH3O4sDm0XLkLavH/e7jTB4f3zxh9/i8SS6AJYrLJiU1J7Ms
        tUjfLoEr48vVPewFe0QqDk/YzdTA2CjQxcjJISFgIvGyZQYLiC0ksIJR4tkOyy5GLiD7C6NE
        77tX7BDOZ0aJP49WssN0zPi8gA0isZxRYtfkdUwQzltGiRtTfjOCVLEJWElMbF8FZgsLhEks
        W/GeDcQWEVCTaDm1hRmkgVlgMqPE5IVfmUASvAJ2Et++tIDZLAKqEld3/wM7SlQgQuLTg8Os
        EDWCEidnPgGLcwpYSxxbcB2snllAXOLWk/lQtrxE89bZYAskBJaxSzStPsEGcbeLRPPiVlYI
        W1ji1fEtUP/ISJye3MMC0bCOUeJvxwuo7u2MEssn/4Pqtpa4c+4XkM0BtEJTYv0ufRBTQsBR
        ove7GYTJJ3HjrSDEDXwSk7ZNZ4YI80p0tAlBzFCT2LBsAxvM1q6dK5knMCrNQvLZLCTfzELy
        zSyEtQsYWVYxiqeWFuempxYb5aWW6xUn5haX5qXrJefnbmIEJpzT/45/2cG460/SIUYBDkYl
        Hl6DnplxQqyJZcWVuYcYJTiYlUR4D7oBhXhTEiurUovy44tKc1KLDzFKc7AoifMaL3oZKySQ
        nliSmp2aWpBaBJNl4uCUamAU+H/Ib/2daUWRFzOCd94tWCcSbdaTvczD/cG7B7cfvpPc5N/a
        Z2q57Jtg29tW8chIXuHrO/w4k87wX4qU3aU/+YdctnFx/JOX6Xz95kd+TpN0+fn91dN/O7Xv
        z11gwxszO9ZE9dhP9YurPpaszVpcW8z5stViS6LbX4lNbzw9c+eveLD24dRPSizFGYmGWsxF
        xYkAGKwDtTQDAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrCIsWRmVeSWpSXmKPExsVy+t/xe7puO2bGGZxcq2Cx8sQ/FosrX9+z
        WZzo+8BqcXnXHDaL2Uv6WSzufH3O4sDm0XLkLavH/e7jTB4f3zxh9/i8SS6AJUrPpii/tCRV
        ISO/uMRWKdrQwkjP0NJCz8jEUs/Q2DzWyshUSd/OJiU1J7MstUjfLkEv48vVPewFe0QqDk/Y
        zdTA2CjQxcjJISFgIjHj8wK2LkYuDiGBpYwSq2YuZexi5ABKyEgcX18GUSMs8edaF1TNa0aJ
        fa/usYEk2ASsJCa2r2IEsYUFwiSWrXgPFhcRUJNoObWFGaSBWWAyo0TH/6dQ3X2MEr8ez2AF
        qeIVsJP49qWFCcRmEVCVuLr7HwuILSoQIXF4xyxGiBpBiZMzn4DFOQWsJY4tuA5WzyygLvFn
        3iVmCFtc4taT+VBxeYnmrbOZJzAKzULSPgtJyywkLbOQtCxgZFnFKJJaWpybnltsqFecmFtc
        mpeul5yfu4kRGGPbjv3cvIPx0sbgQ4wCHIxKPLwGPTPjhFgTy4orcw8xSnAwK4nwHnQDCvGm
        JFZWpRblxxeV5qQWH2I0BXpuIrOUaHI+MP7zSuINTQ3NLSwNzY3Njc0slMR5OwQOxggJpCeW
        pGanphakFsH0MXFwSjUw+nzhZncO0z8lm95o4hb9Os6z5fq7e+emT17xRJ09kts3Y+lHDaXQ
        9k+cTr9FjRRm/+O73bC+5FhJ/LSlgQe0TDg66k68jtEMWKJk9jP3HusGZtnN4s9fvAzNkT6o
        aMiced9x4nWjsBNpBkLWGR36kTw1jQv1D0ZENNhNe3Vp4nT7Zz1vDvAqsRRnJBpqMRcVJwIA
        qsVMCscCAAA=
X-CMS-MailID: 20200417140806eucas1p2f8b9146788f9d6713d758833a8e1ba88
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20200415132418eucas1p2249e350241cee81ce200565455c31f98
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20200415132418eucas1p2249e350241cee81ce200565455c31f98
References: <CGME20200415132418eucas1p2249e350241cee81ce200565455c31f98@eucas1p2.samsung.com>
        <20200415132350.33088-1-yuehaibing@huawei.com>
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org


On 4/15/20 3:23 PM, YueHaibing wrote:
> drivers/video/fbdev/omap2/omapfb/dss/venc.c:212:33:
>  warning: ‘venc_config_pal_bdghi’ defined but not used [-Wunused-const-variable=]
>  static const struct venc_config venc_config_pal_bdghi = {
>                                  ^~~~~~~~~~~~~~~~~~~~~
> 
> Reported-by: Hulk Robot <hulkci@huawei.com>
> Signed-off-by: YueHaibing <yuehaibing@huawei.com>

Patch queued for v5.8 (w/ typo in the patch summary fixed), thanks.

Best regards,
--
Bartlomiej Zolnierkiewicz
Samsung R&D Institute Poland

> ---
>  drivers/video/fbdev/omap2/omapfb/dss/venc.c | 43 ---------------------
>  1 file changed, 43 deletions(-)
> 
> diff --git a/drivers/video/fbdev/omap2/omapfb/dss/venc.c b/drivers/video/fbdev/omap2/omapfb/dss/venc.c
> index f81e2a46366d..d5404d56c922 100644
> --- a/drivers/video/fbdev/omap2/omapfb/dss/venc.c
> +++ b/drivers/video/fbdev/omap2/omapfb/dss/venc.c
> @@ -209,49 +209,6 @@ static const struct venc_config venc_config_ntsc_trm = {
>  	.gen_ctrl				= 0x00F90000,
>  };
>  
> -static const struct venc_config venc_config_pal_bdghi = {
> -	.f_control				= 0,
> -	.vidout_ctrl				= 0,
> -	.sync_ctrl				= 0,
> -	.hfltr_ctrl				= 0,
> -	.x_color				= 0,
> -	.line21					= 0,
> -	.ln_sel					= 21,
> -	.htrigger_vtrigger			= 0,
> -	.tvdetgp_int_start_stop_x		= 0x00140001,
> -	.tvdetgp_int_start_stop_y		= 0x00010001,
> -	.gen_ctrl				= 0x00FB0000,
> -
> -	.llen					= 864-1,
> -	.flens					= 625-1,
> -	.cc_carr_wss_carr			= 0x2F7625ED,
> -	.c_phase				= 0xDF,
> -	.gain_u					= 0x111,
> -	.gain_v					= 0x181,
> -	.gain_y					= 0x140,
> -	.black_level				= 0x3e,
> -	.blank_level				= 0x3e,
> -	.m_control				= 0<<2 | 1<<1,
> -	.bstamp_wss_data			= 0x42,
> -	.s_carr					= 0x2a098acb,
> -	.l21__wc_ctl				= 0<<13 | 0x16<<8 | 0<<0,
> -	.savid__eavid				= 0x06A70108,
> -	.flen__fal				= 23<<16 | 624<<0,
> -	.lal__phase_reset			= 2<<17 | 310<<0,
> -	.hs_int_start_stop_x			= 0x00920358,
> -	.hs_ext_start_stop_x			= 0x000F035F,
> -	.vs_int_start_x				= 0x1a7<<16,
> -	.vs_int_stop_x__vs_int_start_y		= 0x000601A7,
> -	.vs_int_stop_y__vs_ext_start_x		= 0x01AF0036,
> -	.vs_ext_stop_x__vs_ext_start_y		= 0x27101af,
> -	.vs_ext_stop_y				= 0x05,
> -	.avid_start_stop_x			= 0x03530082,
> -	.avid_start_stop_y			= 0x0270002E,
> -	.fid_int_start_x__fid_int_start_y	= 0x0005008A,
> -	.fid_int_offset_y__fid_ext_start_x	= 0x002E0138,
> -	.fid_ext_start_y__fid_ext_offset_y	= 0x01380005,
> -};
> -
>  const struct omap_video_timings omap_dss_pal_timings = {
>  	.x_res		= 720,
>  	.y_res		= 574,
> 

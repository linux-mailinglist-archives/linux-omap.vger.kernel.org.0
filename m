Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8DBABCEB4F
	for <lists+linux-omap@lfdr.de>; Mon,  7 Oct 2019 19:58:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728081AbfJGR6z (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 7 Oct 2019 13:58:55 -0400
Received: from mail.andi.de1.cc ([85.214.55.253]:41490 "EHLO mail.andi.de1.cc"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728079AbfJGR6z (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Mon, 7 Oct 2019 13:58:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=kemnade.info; s=20180802; h=Content-Transfer-Encoding:Content-Type:
        MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Sender
        :Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
        Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
        List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=1e9YvUYbHTjTGxx39yq/yhCu8wiFrtyzwxbNVNLjJyY=; b=j1EtwBtm0uFIGttHj8cdQknkyj
        +cyZXvo1tqqx4N2xvQ0/IVOWxxxQFYHR3dkEn53CD1pEdrQ/NtrGE51toLfobBxoR/YgJ99vwOznj
        +OK+D607QOIXfDgSOFE8m7CFKRI0fZGHkUSDvQEy2lo4ZbyjOAEc7VuDZGWa/eyYXe+8=;
Received: from p200300ccff0a88001a3da2fffebfd33a.dip0.t-ipconnect.de ([2003:cc:ff0a:8800:1a3d:a2ff:febf:d33a] helo=aktux)
        by mail.andi.de1.cc with esmtpsa (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.89)
        (envelope-from <andreas@kemnade.info>)
        id 1iHXHW-0003AN-Mp; Mon, 07 Oct 2019 19:58:51 +0200
Date:   Mon, 7 Oct 2019 19:58:49 +0200
From:   Andreas Kemnade <andreas@kemnade.info>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Discussions about the Letux Kernel <letux-kernel@openphoenux.org>,
        dri-devel@lists.freedesktop.org, linux-omap@vger.kernel.org,
        Tony Lindgren <tony@atomide.com>, Jyri Sarha <jsarha@ti.com>,
        Tomi Valkeinen <tomi.valkeinen@ti.com>,
        thierry.reding@gmail.com, sam@ravnborg.org
Subject: Re: [Letux-kernel] [PATCH 4/5] drm/panel: tpo-td028ttec1: Fix SPI
 alias
Message-ID: <20191007195849.72562d6b@aktux>
In-Reply-To: <20191007170801.27647-5-laurent.pinchart@ideasonboard.com>
References: <20191007170801.27647-1-laurent.pinchart@ideasonboard.com>
        <20191007170801.27647-5-laurent.pinchart@ideasonboard.com>
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Spam-Score: -1.0 (-)
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Mon,  7 Oct 2019 20:08:00 +0300
Laurent Pinchart <laurent.pinchart@ideasonboard.com> wrote:

> The panel-tpo-td028ttec1 driver incorrectly includes the OF vendor
> prefix in its SPI alias. Fix it.
> 
> Fixes: 415b8dd08711 ("drm/panel: Add driver for the Toppoly TD028TTEC1 panel")
> Reported-by: H. Nikolaus Schaller <hns@goldelico.com>
> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

Tested-by: Andreas Kemnade <andreas@kemnade.info>

> ---
>  drivers/gpu/drm/panel/panel-tpo-td028ttec1.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/panel/panel-tpo-td028ttec1.c b/drivers/gpu/drm/panel/panel-tpo-td028ttec1.c
> index d7b2e34626ef..f2baff827f50 100644
> --- a/drivers/gpu/drm/panel/panel-tpo-td028ttec1.c
> +++ b/drivers/gpu/drm/panel/panel-tpo-td028ttec1.c
> @@ -375,8 +375,7 @@ static const struct of_device_id td028ttec1_of_match[] = {
>  MODULE_DEVICE_TABLE(of, td028ttec1_of_match);
>  
>  static const struct spi_device_id td028ttec1_ids[] = {
> -	{ "tpo,td028ttec1", 0},
> -	{ "toppoly,td028ttec1", 0 },
> +	{ "td028ttec1", 0 },
>  	{ /* sentinel */ }
>  };
>  


Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C6F3A43C811
	for <lists+linux-omap@lfdr.de>; Wed, 27 Oct 2021 12:50:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232853AbhJ0Kwu (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 27 Oct 2021 06:52:50 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:49726 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230105AbhJ0Kwu (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Wed, 27 Oct 2021 06:52:50 -0400
Received: from [192.168.1.111] (91-158-153-130.elisa-laajakaista.fi [91.158.153.130])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 73D8C596;
        Wed, 27 Oct 2021 12:50:23 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1635331823;
        bh=zm4Ju6KVTGGgCUZE6E5NbqKgafTnv49emwOdqb/igeM=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=t9zvf566p9pZogIQS2Lt1fMmdSavnByjeMOGTLSwgvfWspEjikzuBDFpZ2wIZpL6m
         Abx0rK465ZcFz3ESIHdSawcf2DEr3Z8Tly/A6vtPya4NDNtjP73zt0MQ74WCH5z6pN
         nsMenkNQHS22OS58Y26eZtWdRgTT0b1+ZLUcT6Mo=
Subject: Re: [PATCH v6 5/9] drm/omap: omap_plane: subclass drm_plane_state
To:     Neil Armstrong <narmstrong@baylibre.com>
Cc:     linux-omap@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, khilman@baylibre.com,
        Benoit Parrot <bparrot@ti.com>
References: <20211018142842.2511200-1-narmstrong@baylibre.com>
 <20211018142842.2511200-6-narmstrong@baylibre.com>
From:   Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Message-ID: <2a92e285-e575-2b31-cdbd-4be9245f0339@ideasonboard.com>
Date:   Wed, 27 Oct 2021 13:50:20 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211018142842.2511200-6-narmstrong@baylibre.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On 18/10/2021 17:28, Neil Armstrong wrote:
> From: Benoit Parrot <bparrot@ti.com>
> 
> In preparation to add omap plane state specific extensions we need to
> subclass drm_plane_state and add the relevant helpers.
> 
> The addition of specific extension will be done separately.
> 
> Signed-off-by: Benoit Parrot <bparrot@ti.com>
> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
> ---
>   drivers/gpu/drm/omapdrm/omap_plane.c | 36 +++++++++++++++++++++++++---
>   1 file changed, 33 insertions(+), 3 deletions(-)

Reviewed-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>

  Tomi

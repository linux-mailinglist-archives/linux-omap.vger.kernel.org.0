Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E45D043C53F
	for <lists+linux-omap@lfdr.de>; Wed, 27 Oct 2021 10:34:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233944AbhJ0Igv (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 27 Oct 2021 04:36:51 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:48354 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233389AbhJ0Igu (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Wed, 27 Oct 2021 04:36:50 -0400
Received: from [192.168.1.111] (91-158-153-130.elisa-laajakaista.fi [91.158.153.130])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 2389D596;
        Wed, 27 Oct 2021 10:34:24 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1635323664;
        bh=vUCM09iiTIAViQw+K7ABY38FS6eG4PlhTe+YM+DHN/I=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=GHKqE+shzWZVKmMFzZ6jF8tYyd1AdmSIGaAOKbCbuY/jKtEQyjISPPL2SaRprXrgw
         aJj8JzFbBZlRMNwJ4uxqNqP4jYhCUg1x637W2mRCEBRqeLT/lvTe2ONj+EaQhh9t+3
         BIIIrcRLdBiV1/gPbuiHlUJu8vvEZ4gAKsvzyKB8=
Subject: Re: [PATCH v6 2/9] drm/omap: Add ability to check if requested plane
 modes can be supported
To:     Neil Armstrong <narmstrong@baylibre.com>
Cc:     linux-omap@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, khilman@baylibre.com,
        Benoit Parrot <bparrot@ti.com>
References: <20211018142842.2511200-1-narmstrong@baylibre.com>
 <20211018142842.2511200-3-narmstrong@baylibre.com>
From:   Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Message-ID: <fe492ead-a898-6a03-b936-e448abc24f3e@ideasonboard.com>
Date:   Wed, 27 Oct 2021 11:34:21 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211018142842.2511200-3-narmstrong@baylibre.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On 18/10/2021 17:28, Neil Armstrong wrote:
> From: Benoit Parrot <bparrot@ti.com>
> 
> We currently assume that an overlay has the same maximum width and
> maximum height as the overlay manager. This assumption is incorrect. On
> some variants the overlay manager maximum width is twice the maximum
> width that the overlay can handle. We need to add the appropriate data
> per variant as well as export a helper function to retrieve the data so
> check can be made dynamically in omap_plane_atomic_check().
> 
> Signed-off-by: Benoit Parrot <bparrot@ti.com>
> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
> ---
>   drivers/gpu/drm/omapdrm/dss/dispc.c  | 22 ++++++++++++++++++++++
>   drivers/gpu/drm/omapdrm/dss/dss.h    |  2 ++
>   drivers/gpu/drm/omapdrm/omap_plane.c | 14 ++++++++++++++
>   3 files changed, 38 insertions(+)

Reviewed-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>

  Tomi


Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 77109361AEE
	for <lists+linux-omap@lfdr.de>; Fri, 16 Apr 2021 10:01:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239109AbhDPH40 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 16 Apr 2021 03:56:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40350 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239087AbhDPH4W (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Fri, 16 Apr 2021 03:56:22 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5571FC061574;
        Fri, 16 Apr 2021 00:55:58 -0700 (PDT)
Received: from [192.168.1.111] (91-157-208-71.elisa-laajakaista.fi [91.157.208.71])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 4775A5A5;
        Fri, 16 Apr 2021 09:55:56 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1618559756;
        bh=+bDaegtHEBYbX+fu3MChiV4GjJPsWdC6eYbLMHjhSXo=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=TUxL2uqXDdDHuDHclH7mHlsOC5nJp1vSYy+A/XgmgGf15mtVBq029xAuWTZKWO7/C
         tuDHzAw03sgi+/5aC/Em/VYz7agA2T8JWXKYRF7EpKqyJvA5bu3G3t8RCxWRdflvEj
         fZpUsW3kDEyGnyKWv9Q0qsUZCBb8tfaLavbhwXZI=
Subject: Re: [PATCHv2 2/6] drm/omapdrm/dss/hdmi4: switch to the connector
 bridge ops
To:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        linux-media@vger.kernel.org
Cc:     Tony Lindgren <tony@atomide.com>, Sekhar Nori <nsekhar@ti.com>,
        dri-devel@lists.freedesktop.org,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        linux-omap@vger.kernel.org, devicetree@vger.kernel.org
References: <20210302162403.983585-1-hverkuil-cisco@xs4all.nl>
 <20210302162403.983585-3-hverkuil-cisco@xs4all.nl>
From:   Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Message-ID: <5a8dc63a-c711-2b99-0735-6427dc1a1a11@ideasonboard.com>
Date:   Fri, 16 Apr 2021 10:55:55 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210302162403.983585-3-hverkuil-cisco@xs4all.nl>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On 02/03/2021 18:23, Hans Verkuil wrote:
> Implement the new connector_attach/detach bridge ops. This makes it
> possible to associate a CEC adapter with a drm connector, which helps
> userspace determine which cec device node belongs to which drm connector.
> 
> Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
> ---
>   drivers/gpu/drm/omapdrm/dss/hdmi4.c     | 27 +++++++++++++++++--------
>   drivers/gpu/drm/omapdrm/dss/hdmi4_cec.c |  9 ++++++---
>   drivers/gpu/drm/omapdrm/dss/hdmi4_cec.h |  7 ++++---
>   3 files changed, 29 insertions(+), 14 deletions(-)

Reviewed-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>

  Tomi

Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 99F2E43C548
	for <lists+linux-omap@lfdr.de>; Wed, 27 Oct 2021 10:35:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235968AbhJ0Ihv (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 27 Oct 2021 04:37:51 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:48398 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233389AbhJ0Ihu (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Wed, 27 Oct 2021 04:37:50 -0400
Received: from [192.168.1.111] (91-158-153-130.elisa-laajakaista.fi [91.158.153.130])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 8C20C596;
        Wed, 27 Oct 2021 10:35:24 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1635323724;
        bh=PHqL24TPiqhLyMpdtDuXEIKdxWSbGMXdpe3rK+VcaNA=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=XTSQndbk/yHNJ55gENbsQTXHHVqsYl9jmrDWL/w/ZIpJdq1liXB7woTOqoy+vLfu6
         Llaemg6BhqF3it1mYfbmnMc6k+TqkT+D8NylM4+PIb2V41MFhm7agCBouYo0fGyzbN
         46+jhG7hF7s0Op4EnBtsyt8RXaYwbMU79OnubRNk=
Subject: Re: [PATCH v6 3/9] drm/omap: Add ovl checking funcs to dispc_ops
To:     Neil Armstrong <narmstrong@baylibre.com>
Cc:     linux-omap@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, khilman@baylibre.com,
        Benoit Parrot <bparrot@ti.com>
References: <20211018142842.2511200-1-narmstrong@baylibre.com>
 <20211018142842.2511200-4-narmstrong@baylibre.com>
From:   Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Message-ID: <aecc7b00-3b12-f419-07a9-db4e471b2408@ideasonboard.com>
Date:   Wed, 27 Oct 2021 11:35:22 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211018142842.2511200-4-narmstrong@baylibre.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On 18/10/2021 17:28, Neil Armstrong wrote:
> From: Benoit Parrot <bparrot@ti.com>
> 
> In order to be able to dynamically assign overlays to planes we need to
> be able to asses the overlay capabilities.
> 
> Add a helper function to be able to retrieve the supported capabilities
> of an overlay.
> 
> And export the function to check if a fourcc is supported on a given
> overlay.
> 
> Signed-off-by: Benoit Parrot <bparrot@ti.com>
> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
> ---
>   drivers/gpu/drm/omapdrm/dss/dispc.c | 9 +++++++--
>   drivers/gpu/drm/omapdrm/dss/dss.h   | 3 +++
>   2 files changed, 10 insertions(+), 2 deletions(-)

Reviewed-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>

  Tomi


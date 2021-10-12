Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 52E79429E66
	for <lists+linux-omap@lfdr.de>; Tue, 12 Oct 2021 09:15:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233439AbhJLHRR (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 12 Oct 2021 03:17:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44122 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233602AbhJLHRQ (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 12 Oct 2021 03:17:16 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 00ECCC061570;
        Tue, 12 Oct 2021 00:15:14 -0700 (PDT)
Received: from [192.168.1.111] (91-158-153-130.elisa-laajakaista.fi [91.158.153.130])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 97264F1;
        Tue, 12 Oct 2021 09:15:11 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1634022911;
        bh=bwwneXptR3fIUmxlEKyinPusHZqeroYeldtSJarcPqo=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=m3oMckN5BEtG/5zjHAlhaWW1W5X3bvL5tztDTFfs20e/ob3Q/pc2gxLm4IK0D4yIK
         yDWJp+TyBTdOJmZl2L9PQxu2IvqRWUA5QGK2QxwAccLv+2HlLxQWglXIk0TaFM7A8s
         /+vvPhkFne06xoAJyhuAooj3VWJ/fEOeH9dr7UrY=
Subject: Re: [PATCH v5 0/8] drm/omap: Add virtual-planes support
To:     Neil Armstrong <narmstrong@baylibre.com>
Cc:     linux-omap@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, khilman@baylibre.com
References: <20210923070701.145377-1-narmstrong@baylibre.com>
From:   Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Message-ID: <e7c295be-7a0c-877c-ba25-3b580d7d9521@ideasonboard.com>
Date:   Tue, 12 Oct 2021 10:15:08 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210923070701.145377-1-narmstrong@baylibre.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On 23/09/2021 10:06, Neil Armstrong wrote:
> This patchset is the follow-up the v4 patchset from Benoit Parrot at [1].
> 
> This patch series adds virtual-plane support to omapdrm driver to allow the use
> of display wider than 2048 pixels.
> 
> In order to do so we introduce the concept of hw_overlay which can then be
> dynamically allocated to a plane. When the requested output width exceed what
> be supported by one overlay a second is then allocated if possible to handle
> display wider then 2048.
> 
> This series replaces an earlier series which was DT based and using statically
> allocated resources.
> 
> This implementation is inspired from the work done in msm/disp/mdp5
> driver.
> 
> Changes since v4 at [1]:
> - rebased on v5.15-rc2

What is this based on? Doesn't apply to v5.15-rc2, and "error: sha1 
information is lacking or useless".

  Tomi

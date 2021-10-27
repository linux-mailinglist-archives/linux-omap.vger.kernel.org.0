Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5F4A843C535
	for <lists+linux-omap@lfdr.de>; Wed, 27 Oct 2021 10:31:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238627AbhJ0IeL (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 27 Oct 2021 04:34:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45394 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239011AbhJ0IeE (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Wed, 27 Oct 2021 04:34:04 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B1758C0432C7;
        Wed, 27 Oct 2021 01:29:22 -0700 (PDT)
Received: from [192.168.1.111] (91-158-153-130.elisa-laajakaista.fi [91.158.153.130])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 110F1596;
        Wed, 27 Oct 2021 10:29:20 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1635323360;
        bh=ZTxjc1XWpuboGG/O4vVtLIPrMyAcKbxdbhRyjYyHbM0=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=NyzggpmnL+IQVYBMnkB2upSyIgIP3dFlF3+3olECgBeaWzGS8lUrFyYHDNJA+qucm
         tmTZtqjimzTHPjyLcbwDFofFyAo/qIg6TJ7YhWyIILHx2HR6GAzpRBlPPmrI3pcl66
         FVkFCEAIwNp1A+T4f5cmsttpjDXg4wKh+XzC3ss0=
Subject: Re: [PATCH v6 1/9] drm/omap: add sanity plane state check
To:     Neil Armstrong <narmstrong@baylibre.com>
Cc:     linux-omap@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, khilman@baylibre.com,
        Benoit Parrot <bparrot@ti.com>
References: <20211018142842.2511200-1-narmstrong@baylibre.com>
 <20211018142842.2511200-2-narmstrong@baylibre.com>
From:   Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Message-ID: <ea3d01fd-b723-b245-90cc-c5874f95122c@ideasonboard.com>
Date:   Wed, 27 Oct 2021 11:29:17 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211018142842.2511200-2-narmstrong@baylibre.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On 18/10/2021 17:28, Neil Armstrong wrote:
> Call drm_atomic_helper_check_plane_state() from the plane
> atomic_check() callback in order to add plane state sanity
> checking.
> 
> It will permit filtering out totally bad scaling factors, even
> if the real check are done later in the atomic commit.

I think there's more to it: the function sets plane_state->visible, 
which is used in later patches.

  Tomi

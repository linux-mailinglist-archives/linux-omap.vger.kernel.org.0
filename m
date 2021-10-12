Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F3C3142A23C
	for <lists+linux-omap@lfdr.de>; Tue, 12 Oct 2021 12:36:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236105AbhJLKiN (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 12 Oct 2021 06:38:13 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:53022 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236013AbhJLKiJ (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 12 Oct 2021 06:38:09 -0400
Received: from [192.168.1.111] (91-158-153-130.elisa-laajakaista.fi [91.158.153.130])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 91BFD8C4;
        Tue, 12 Oct 2021 12:36:06 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1634034966;
        bh=ijFZWx5zzw5XuaJtr8vLmCBe4W1PxzsU1aR9H3mFgAw=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=D1v2XUUVS2TKmcsuLkPvji8bZxMRpajuzlVfe+NlEzOPGSGO01ZmF16R8VzAH/OQC
         Hms9+YfDQIrgRSrmLUBcRlNCPiNtS3ffb3s3s231AwTRwP21MfTUmzZhu+dUdyMnAN
         9/m+6+qzG/OiNN6phBqCFXAszgJclbdzVQoaKxyI=
Subject: Re: [PATCH v5 0/8] drm/omap: Add virtual-planes support
To:     Neil Armstrong <narmstrong@baylibre.com>
Cc:     linux-omap@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, khilman@baylibre.com
References: <20210923070701.145377-1-narmstrong@baylibre.com>
 <e7c295be-7a0c-877c-ba25-3b580d7d9521@ideasonboard.com>
 <a4e72823-6e92-cce1-0607-5506ddda42fa@baylibre.com>
From:   Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Message-ID: <99c11b0b-eab8-a7b9-8aab-8cc06be14cd5@ideasonboard.com>
Date:   Tue, 12 Oct 2021 13:36:03 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <a4e72823-6e92-cce1-0607-5506ddda42fa@baylibre.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On 12/10/2021 11:30, Neil Armstrong wrote:
> On 12/10/2021 09:15, Tomi Valkeinen wrote:
>> On 23/09/2021 10:06, Neil Armstrong wrote:
>>> This patchset is the follow-up the v4 patchset from Benoit Parrot at [1].
>>>
>>> This patch series adds virtual-plane support to omapdrm driver to allow the use
>>> of display wider than 2048 pixels.
>>>
>>> In order to do so we introduce the concept of hw_overlay which can then be
>>> dynamically allocated to a plane. When the requested output width exceed what
>>> be supported by one overlay a second is then allocated if possible to handle
>>> display wider then 2048.
>>>
>>> This series replaces an earlier series which was DT based and using statically
>>> allocated resources.
>>>
>>> This implementation is inspired from the work done in msm/disp/mdp5
>>> driver.
>>>
>>> Changes since v4 at [1]:
>>> - rebased on v5.15-rc2
>>
>> What is this based on? Doesn't apply to v5.15-rc2, and "error: sha1 information is lacking or useless".
> 
> Indeed the sha1 info is useless, it's based on v5.15-rc2 on top of "HACK: drm/omap: increase DSS5 max tv pclk to 192MHz"
> in order to validate on 2k monitors.

I'm personally fine with removing the HACK from that, and applying it 
too. I used the patch for a long time without any issues. However, I 
never found anyone to confirm that 192MHz is fine (or that it's not 
fine). Too old HW for finding HW engineers to look at it =).

  Tomi

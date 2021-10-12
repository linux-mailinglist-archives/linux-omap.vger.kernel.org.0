Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D8E51429FE1
	for <lists+linux-omap@lfdr.de>; Tue, 12 Oct 2021 10:30:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235061AbhJLIcS (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 12 Oct 2021 04:32:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33274 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235240AbhJLIcO (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 12 Oct 2021 04:32:14 -0400
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com [IPv6:2a00:1450:4864:20::42b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B699AC06161C
        for <linux-omap@vger.kernel.org>; Tue, 12 Oct 2021 01:30:12 -0700 (PDT)
Received: by mail-wr1-x42b.google.com with SMTP id r7so64430866wrc.10
        for <linux-omap@vger.kernel.org>; Tue, 12 Oct 2021 01:30:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=subject:to:cc:references:from:organization:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=v0u01eW6pVIEIVQHUq1gwzCt0Crh/8LM88kItCmByGY=;
        b=AWL3WWm5TA1JOb/tjU59RANSfhru3mTDLFmtdWuDqd7U5T+SjpAZ3iMkoK1UrF/Brj
         jDr3fWCedHYfmt9d0VTl/piGF4LjArq6gz7v04tJaTHTwBtXV65XynhSfz4Fco9ZlJgb
         PgRietc/wmfDWkRW8jCwh8WI7YS29phZFKLQ7bft5+lty4Ti3Q4EjeETqVQ0fo/skO/G
         gPyWdkWJiEkgE8HXV/RAYC79mcljZPGDs1/PaPTx/zyGB14j3DcQhJovzq6Tz39v1cjf
         5wwJ7Rg/ysTIP91czuov5XgI1u5ouQCPccO7kWx4tn4FMaC/8/uayGCtYXxni6renSrm
         30zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:organization
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=v0u01eW6pVIEIVQHUq1gwzCt0Crh/8LM88kItCmByGY=;
        b=rfl85rVBUXPgJ887BOEgdXhqQjYi+4giVPx1ekTDI/KmKF7PxhI5QeOiwKLwRAtqRr
         exUXqVAX8F5gnVvm/wZsmZFESY9quCWRH9MebX6e8KCzhoy6Dh5bwavjmBM92shPAKdm
         xqxbbs3MCYsbZEVmyS0Cp3U1tzQ9Kpa9RGYPV0G1ekHwGvrp2YokiN6ZoHmWiCEMmk76
         43sHajzzLJVmrbLZzdA6vwICx/bYrTS3Vy3sQyMsABpND9vywchQP2ncFzdrW2QykCIT
         RRbclHPnbTTwBD75GqgUPhGeH9lWQayN2J6XtbjGAqGCPceiBtUeEIKvTSsLEUVceiCM
         7fuA==
X-Gm-Message-State: AOAM532U46q/VIiF2SQZi8ZjAyCOqI4bHxVIIPm1G54852m2r61hynTt
        VavZ1i6qCKhXqld5CSzx2uyFyQ==
X-Google-Smtp-Source: ABdhPJzkvaqzlM1do02bHVH6nS44rfitAqHTBfh0TXPk0pMJNJEPFYCHWU9I1CdkwwqSiOH4AiRUOw==
X-Received: by 2002:a05:600c:4fd1:: with SMTP id o17mr4146166wmq.110.1634027411159;
        Tue, 12 Oct 2021 01:30:11 -0700 (PDT)
Received: from ?IPv6:2001:861:44c0:66c0:4e93:9fa7:4d66:4f5c? ([2001:861:44c0:66c0:4e93:9fa7:4d66:4f5c])
        by smtp.gmail.com with ESMTPSA id q14sm1817081wmq.4.2021.10.12.01.30.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 12 Oct 2021 01:30:10 -0700 (PDT)
Subject: Re: [PATCH v5 0/8] drm/omap: Add virtual-planes support
To:     Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc:     linux-omap@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, khilman@baylibre.com
References: <20210923070701.145377-1-narmstrong@baylibre.com>
 <e7c295be-7a0c-877c-ba25-3b580d7d9521@ideasonboard.com>
From:   Neil Armstrong <narmstrong@baylibre.com>
Organization: Baylibre
Message-ID: <a4e72823-6e92-cce1-0607-5506ddda42fa@baylibre.com>
Date:   Tue, 12 Oct 2021 10:30:10 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <e7c295be-7a0c-877c-ba25-3b580d7d9521@ideasonboard.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On 12/10/2021 09:15, Tomi Valkeinen wrote:
> On 23/09/2021 10:06, Neil Armstrong wrote:
>> This patchset is the follow-up the v4 patchset from Benoit Parrot at [1].
>>
>> This patch series adds virtual-plane support to omapdrm driver to allow the use
>> of display wider than 2048 pixels.
>>
>> In order to do so we introduce the concept of hw_overlay which can then be
>> dynamically allocated to a plane. When the requested output width exceed what
>> be supported by one overlay a second is then allocated if possible to handle
>> display wider then 2048.
>>
>> This series replaces an earlier series which was DT based and using statically
>> allocated resources.
>>
>> This implementation is inspired from the work done in msm/disp/mdp5
>> driver.
>>
>> Changes since v4 at [1]:
>> - rebased on v5.15-rc2
> 
> What is this based on? Doesn't apply to v5.15-rc2, and "error: sha1 information is lacking or useless".

Indeed the sha1 info is useless, it's based on v5.15-rc2 on top of "HACK: drm/omap: increase DSS5 max tv pclk to 192MHz"
in order to validate on 2k monitors.

My bad, I thought it would apply based on this patch, I'll rebase on v5.15-rc2 for v6.

Thanks for the review,
Neil
> 
>  Tomi


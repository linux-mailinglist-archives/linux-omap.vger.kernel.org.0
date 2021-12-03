Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7FA27467A11
	for <lists+linux-omap@lfdr.de>; Fri,  3 Dec 2021 16:09:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245304AbhLCPNK (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 3 Dec 2021 10:13:10 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34626 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S245133AbhLCPNJ (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Fri, 3 Dec 2021 10:13:09 -0500
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com [IPv6:2a00:1450:4864:20::42c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 62850C061354
        for <linux-omap@vger.kernel.org>; Fri,  3 Dec 2021 07:09:45 -0800 (PST)
Received: by mail-wr1-x42c.google.com with SMTP id i5so6420374wrb.2
        for <linux-omap@vger.kernel.org>; Fri, 03 Dec 2021 07:09:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=subject:to:cc:references:from:organization:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=waV1npKtrBCQx1BdtxDZJlwzTMwSFFCWDGHrj9kXp+g=;
        b=ojLwcLS3q+5lu9Md+ylAfjdkQjmhI3t0vBLaOWzMZaSbzQsN801Uv+Rs8JlM+Fnefz
         dLi8R30/TTbF3vL2wSCNQo4o5NxscRaPCjak/3yolpMikXNDtF1qXzylYLQhWvTVG/ai
         0Gxrz7ppbDeJcHJR/sDTiOOF/fMa+a0NL50YK9+R7jmKC0M+m/nrMEpmnhlFc8f2YlDj
         MiytKJwnfe9xoEOUeRXrGW4DyE61Oz57CNZAPNrBvxhc1F5XRLBZdcT7SNpQlITSain7
         yxvtPecFBTnRsaP629RuTQGe9XxUB53qk0XBY/fWvc5zovkWFEjwD3xr39NIcn/rkhYX
         uN5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:organization
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=waV1npKtrBCQx1BdtxDZJlwzTMwSFFCWDGHrj9kXp+g=;
        b=UMQTsAmGPVzwQf6AE9dSAcLxT2qpH5eCxOmY3KoKtkg1nDOWPv8w8+EsEfDAjOuwly
         xo3cpdXwiZVINzf9rQws2CcLWNCtMuy75eK9ZA+v0sitdyBRJ2zkLtH0TOguQFp93Fl4
         QzAJlmVO74c8I/bQ9n0UAD76A8JZCbTKAecNYACbwPl6cEMGt3c6D5X21YD/rGegl/+B
         R93duZgBc5CDUiN4xiCdmA0+M6fivXfuL9Ga0qcbQkH7jrJyZbcV5ImhWeWoL1qYuoqM
         4XsmdEOD8I4s5Rx5cAjn09kDLiKpLYsudT7JlAsplS5CM6sKEl683HZAV0bLFBN5tMcD
         Bu8Q==
X-Gm-Message-State: AOAM5313Dt4FDbkH2CsISipUQ0vXLS5nyjSSc5PIiKQr4HVsi2lBzS/B
        bHi9c0CUszWVM2QK84f982fZWg==
X-Google-Smtp-Source: ABdhPJyqLILEVhNUxFLPLtBUGu4NPp9AokVet23hbEKTHhte6QSXOYL1Wbtj5MT8I5aKoY+hEy5Upw==
X-Received: by 2002:a5d:68c1:: with SMTP id p1mr21450510wrw.585.1638544183855;
        Fri, 03 Dec 2021 07:09:43 -0800 (PST)
Received: from ?IPv6:2001:861:44c0:66c0:d539:1fa4:f06d:ec1? ([2001:861:44c0:66c0:d539:1fa4:f06d:ec1])
        by smtp.gmail.com with ESMTPSA id a10sm5469480wmq.27.2021.12.03.07.09.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 03 Dec 2021 07:09:43 -0800 (PST)
Subject: Re: [PATCH v7 0/9] drm/omap: Add virtual-planes support
To:     Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc:     linux-omap@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, khilman@baylibre.com
References: <20211117141928.771082-1-narmstrong@baylibre.com>
 <bab2b84a-ebef-ec69-187f-745e739079eb@ideasonboard.com>
From:   Neil Armstrong <narmstrong@baylibre.com>
Organization: Baylibre
Message-ID: <71f01ce0-bc1d-0ac0-9bf2-7f2c3738eeaa@baylibre.com>
Date:   Fri, 3 Dec 2021 16:09:42 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <bab2b84a-ebef-ec69-187f-745e739079eb@ideasonboard.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi,

On 03/12/2021 12:31, Tomi Valkeinen wrote:
> On 17/11/2021 16:19, Neil Armstrong wrote:
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
> 
> I think this looks good. I'll apply this to my work tree to see if I see any issues during my daily work, and if not, I'll push to drm-misc-next.
> 
> Have you tested this with other platforms than x15? I'm mostly thinking about omap3/4, as the DSS is somewhat different on those platforms.

I haven't tested the last version non non-x15, but I haven't changed the logic from the original patchset which was in the TI BSP
tree for multiple years.

Neil

> 
>  Tomi


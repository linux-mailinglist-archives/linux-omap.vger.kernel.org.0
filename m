Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7F9B845A30F
	for <lists+linux-omap@lfdr.de>; Tue, 23 Nov 2021 13:47:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236595AbhKWMu6 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 23 Nov 2021 07:50:58 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39324 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232746AbhKWMu6 (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 23 Nov 2021 07:50:58 -0500
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com [IPv6:2a00:1450:4864:20::330])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2D0DCC061714
        for <linux-omap@vger.kernel.org>; Tue, 23 Nov 2021 04:47:50 -0800 (PST)
Received: by mail-wm1-x330.google.com with SMTP id g191-20020a1c9dc8000000b0032fbf912885so2454251wme.4
        for <linux-omap@vger.kernel.org>; Tue, 23 Nov 2021 04:47:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=subject:to:cc:references:from:organization:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=DPKVXrNzYgoC2uUoh98bh1nz52kdWi1et/X5YOSDFR0=;
        b=M5FlyGfjXy9+OX326j20Q4mvrjdeDsQP4V3g7zOdGnmRtJPdYwFo0KEOJbr/471hcc
         I2OHgcSYf5nwp5qUh7ktXgF/HxLgOwy8FTrb/KvBDdyKpTQmERn0nXC6fEGXeeP+gBfC
         NqUwMEPtKKeCmMbJK0Xev5pYcJVPAhoLP7WAhopmFHNGE+OjEAcCBL9+NU53+corZZ//
         IF3S5+X2eYroGwxnfkLyNj4m+umeAbbHoK6XrEBMXvegjW0m0SdEHMURCE9E3dG6WfGv
         /rDqUcyMjkB2U8/wIauIOQnXGlimkytFfesLieKq7rOdGlPgIT5KC7lbJ3EX7aTiRDFC
         oHvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:organization
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=DPKVXrNzYgoC2uUoh98bh1nz52kdWi1et/X5YOSDFR0=;
        b=s3ifpjY+TV5bcbG+ScIUDaVodyapDGznJ+fZhYIlexLLWTJ7ArfMMNS0mfH36vAamI
         I75h5zvPgG+Ll7Wn+tZHd36EAvJTIHUC2tzHhafivpdjp1rg+ssNYc7dvTRHrpRnygPu
         L1cL+kD11Rfjp184lDAAEt0TwglzhpG7WGUuji9pIXwSt3cknzOk89HeJOTY6bldj0Iz
         9J492XJ7Qf8CBWrqHA49ATUlrZBt+lqYdQz5G1/Xz3M+8X07KnSBQkP/wh/fA62hMStH
         gZi5NBz0TSZxBsn/Nb7kZw/anzAn165feYZIIUIJAzmLGPJGdCc69Hv9IWPadZt3K3LZ
         8SAg==
X-Gm-Message-State: AOAM530Elvoosvi8cJmM75uDXqkMx3nY+BustVU2efi22hTFY6NHXLkJ
        0VZkTXEczkMPYvEUVnYeVlYyGA==
X-Google-Smtp-Source: ABdhPJzQpbHrFm1utephBQ6K5SDC+8s8G+Ss4Ug6gsmSHFZu+z10jpesHg8TLDzbFid/APB/mcCyCQ==
X-Received: by 2002:a05:600c:4fcd:: with SMTP id o13mr2697797wmq.175.1637671668496;
        Tue, 23 Nov 2021 04:47:48 -0800 (PST)
Received: from ?IPv6:2001:861:44c0:66c0:5732:d3c2:58d8:3499? ([2001:861:44c0:66c0:5732:d3c2:58d8:3499])
        by smtp.gmail.com with ESMTPSA id g5sm17562891wri.45.2021.11.23.04.47.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 23 Nov 2021 04:47:47 -0800 (PST)
Subject: Re: [PATCH v2 1/1] ARM: dts: dra7: add entry for bb2d module
To:     Yongqin Liu <yongqin.liu@linaro.org>,
        Tony Lindgren <tony@atomide.com>
Cc:     linux-omap@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Gowtham Tammana <g-tammana@ti.com>,
        Jyri Sarha <jsarha@ti.com>
References: <20210921071807.30978-1-narmstrong@baylibre.com>
 <20210921071807.30978-2-narmstrong@baylibre.com>
 <YV1UdSVOrZ3B9pq/@atomide.com>
 <CAMSo37UN78k=WE0CwRyNNV3P9kau+JzVZ7mHOMMvh5Bn=+=jAQ@mail.gmail.com>
From:   Neil Armstrong <narmstrong@baylibre.com>
Organization: Baylibre
Message-ID: <78b51650-0e32-e81f-0191-2222580e7343@baylibre.com>
Date:   Tue, 23 Nov 2021 13:47:47 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <CAMSo37UN78k=WE0CwRyNNV3P9kau+JzVZ7mHOMMvh5Bn=+=jAQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi,

On 23/11/2021 13:17, Yongqin Liu wrote:
> Hi, Neil, Tony
> 
> # sorry for the confusion if you have received the mail which I sent
> before, which is not in plain text mode.
> 
> We have one out of tree change to enable the SGX544 gpu for the
> beagleboard-X15 Android build,
>     https://android-review.linaro.org/c/kernel/common/+/20521/11/arch/arm/boot/dts/dra7.dtsi
> 
> and that seems to conflict with this BB2D enabling change,
> Could you please help give some suggestions on how we should update our patch
> to make it work with BB2D, without the revert of this change?

This BB2D patch alters the target-module@59000000 while your SGX
change alters the target-module@56000000.

Please rebase your patches.

Neil

> 
> On Wed, 6 Oct 2021 at 15:47, Tony Lindgren <tony@atomide.com> wrote:
>>
>> * Neil Armstrong <narmstrong@baylibre.com> [210921 10:18]:
>>> From: Gowtham Tammana <g-tammana@ti.com>
>>>
>>> BB2D is a Vivante GC 2D Accelerator.
>>> This adds the node to the dts file within a target module node.
>>> Crossbar index number is used for interrupt mapping.
>>
>> Thanks applying into omap-for-v5.16/dt.
>>
>> Tony
> 


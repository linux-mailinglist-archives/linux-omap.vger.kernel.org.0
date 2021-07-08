Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 119DE3C1957
	for <lists+linux-omap@lfdr.de>; Thu,  8 Jul 2021 20:44:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229497AbhGHSqs (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 8 Jul 2021 14:46:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50096 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229469AbhGHSqr (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Thu, 8 Jul 2021 14:46:47 -0400
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com [IPv6:2a00:1450:4864:20::230])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 25D30C061574
        for <linux-omap@vger.kernel.org>; Thu,  8 Jul 2021 11:44:05 -0700 (PDT)
Received: by mail-lj1-x230.google.com with SMTP id z9so3991848ljm.2
        for <linux-omap@vger.kernel.org>; Thu, 08 Jul 2021 11:44:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=to:cc:references:from:subject:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=sZLRjLlW9rCFGc6nixJiX9bwDDQ89fssA6LELgHRP2g=;
        b=mLKGojjwcJW00cHWbOZKVBrkyZqyNh1wQPFTL6MM/Su1uR36dEoikv7Y9lXp5N57sV
         BtzrnHNao1VY58bbI9eLab+ZH0qlz7K9wneeqg86rFKDYfe7tcnNuhKNRRz5RNi53ARm
         y+QP9PKArjVsUOSXJKfEhblmmB4yKVIt4qBAzrHnDtNVlIQT2BQlZGzWYXRR0/wwX6eb
         g1iw0rBzbAc8AEVjUQ0SDOoJ6gPCyy7EfOrH3aplLAYu4N5QV0lKLYHBUn8INwbvgpen
         9ylqnOJiUsZzquMebpgyxUfVHDUJjBh1f4I6q8ITNPBa728GtDdsH0gU2RC8Yh8Fda52
         WVwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:to:cc:references:from:subject:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=sZLRjLlW9rCFGc6nixJiX9bwDDQ89fssA6LELgHRP2g=;
        b=BANh7b4R/fqCbNwecVYsjn6jYN6dtTFoDDiOkVjETSO1KXvCcZLYvvsgfVlp2BX+ms
         jRjqz0CI3NcZ07qt3rj+8cvAIF2lrJJosIZWTOtXaXn37KWQn1JMK2M9BhxmLZ9RwAyv
         y0MPiMqYX4DtSGPrRfMe/JAGQvDkm9Fcpgc050m2OBzA1YfvCyeTiSKVydI98pTNbQik
         atlJY0xkMHWpaOCxnY1LM5s7BNkriuT+TgX1YgPCA9FhftbwK97ZJC/Nwmqov5xghvFc
         SgIoPDZA2vy5c4E0HGmuR7P6ZBAL9y5L8DNWhE0K0OTJiyQOgSwqxPkXYdn0voBuMF6+
         +UZg==
X-Gm-Message-State: AOAM531CEYqjpt48kDtYR50ds+oLW0gUcO6/G4NOqvqFuuBLeO3WujSz
        sOiJ3Hm4A277n4eik7uFc+g=
X-Google-Smtp-Source: ABdhPJwh/wKk+yXECXyGQPEMUA4y3cxiWH/jZJiCDYggPwYFl5eENVN9rV1JXyDvN1rgDMaHmPIbSQ==
X-Received: by 2002:a2e:b80e:: with SMTP id u14mr11857415ljo.204.1625769843319;
        Thu, 08 Jul 2021 11:44:03 -0700 (PDT)
Received: from [10.0.0.40] (91-155-111-71.elisa-laajakaista.fi. [91.155.111.71])
        by smtp.gmail.com with ESMTPSA id e20sm306074ljk.67.2021.07.08.11.44.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 Jul 2021 11:44:02 -0700 (PDT)
To:     Mark Brown <broonie@kernel.org>
Cc:     tony@atomide.com, alsa-devel@alsa-project.org, lgirdwood@gmail.com,
        linux-omap@vger.kernel.org, hns@goldelico.com
References: <20210705194249.2385-1-peter.ujfalusi@gmail.com>
 <20210707173245.GK4394@sirena.org.uk>
From:   =?UTF-8?Q?P=c3=a9ter_Ujfalusi?= <peter.ujfalusi@gmail.com>
Subject: Re: [PATCH v2 0/5] ASoC: ti: davinci-mcasp: Fix the DIT mode and
 OMAP4 support
Message-ID: <b800e9ff-c8dc-ca09-8b2d-a750f05edb12@gmail.com>
Date:   Thu, 8 Jul 2021 21:44:05 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210707173245.GK4394@sirena.org.uk>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi Mark, Tony,

On 07/07/2021 20:32, Mark Brown wrote:
> On Mon, Jul 05, 2021 at 10:42:44PM +0300, Peter Ujfalusi wrote:
> 
>> Mark, Tony:
>> The ASoC and dts patches can go via separate tree I felt that it is better if
>> they are together, at least initially.
> 
> I'm happy to take both through ASoC?  The patches look fine to me.

Tony prefers if I leave the TRM documented (but not working) Smart-idle
mode intact in DT for the McASP and add some quirk via
drivers/bus/ti-sysc.c.
Tony, can you confirm it?

The ASoC patches are not affected by this, it is just that we need to
block SIDLE mode in a different way than how I did it in the last patch.

I'll take a look on how to implement the needed quirk for the McASP
module, then I can send the dts+ti-sysc patch to linux-omap.

-- 
Péter

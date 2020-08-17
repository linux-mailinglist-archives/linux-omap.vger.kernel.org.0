Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 404AC2471C5
	for <lists+linux-omap@lfdr.de>; Mon, 17 Aug 2020 20:33:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388188AbgHQSdc (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 17 Aug 2020 14:33:32 -0400
Received: from mail-ed1-f44.google.com ([209.85.208.44]:45974 "EHLO
        mail-ed1-f44.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2391186AbgHQSdR (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Mon, 17 Aug 2020 14:33:17 -0400
Received: by mail-ed1-f44.google.com with SMTP id di22so13090850edb.12;
        Mon, 17 Aug 2020 11:33:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=QmO3uvT88Y7xfBE4lz9MHma2PYoQCTd+wB0capezBv0=;
        b=R5JJFbdBrRfLZ816G4DHqPVn9IczclPmQ7RMot+RmOrSEnQn8Lo390egMU74bEm5tG
         isNBbWwqAlH0VNMc0cNBnuGERA3mBPwsoMNVkJNAwlwSneEXH44fBBSFQ0av8Tf6IELb
         AqnaknI5ljbiEc8cwLGYrTwqOgN9tN6JhJrcvBlt2dNRlck8Crs6O/q7ShZPACnVmc9C
         XfWBEYqwVNekUasyQQjJmNhC4wsEi659+5nj0hqtYAltcEPdxHSJDZYVyZD1iiEyBBoO
         yKCEy17FJIsEE4G2fFUV+AePsT8SbVM055FD5bL42TXeiLV6NkheZ07LcAfGcozt6xdv
         dnoA==
X-Gm-Message-State: AOAM533rj44TKui0n6jGap6CgILGJ1W0nO2zauFX3HiTQE0PA0w2W/Td
        eZEdGHzAgJess/SVufIqiQE=
X-Google-Smtp-Source: ABdhPJy9rEqsu6PSHPwz3o6/BMqL4DsRfpZPR18TKNyG7qnCp4CpeI0lXFtkg/vTNx/LD9TOaQYajw==
X-Received: by 2002:a05:6402:1606:: with SMTP id f6mr15585384edv.328.1597689195066;
        Mon, 17 Aug 2020 11:33:15 -0700 (PDT)
Received: from kozik-lap ([194.230.155.216])
        by smtp.googlemail.com with ESMTPSA id g11sm14060406edv.95.2020.08.17.11.33.13
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 17 Aug 2020 11:33:14 -0700 (PDT)
Date:   Mon, 17 Aug 2020 20:33:11 +0200
From:   Krzysztof Kozlowski <krzk@kernel.org>
To:     Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>,
        Markus Mayer <mmayer@broadcom.com>,
        bcm-kernel-feedback-list@broadcom.com,
        Florian Fainelli <f.fainelli@gmail.com>,
        Santosh Shilimkar <ssantosh@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Roger Quadros <rogerq@ti.com>,
        Tony Lindgren <tony@atomide.com>,
        Vladimir Zapolskiy <vz@mleia.com>,
        Kukjin Kim <kgene@kernel.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-omap@vger.kernel.org,
        linux-samsung-soc@vger.kernel.org, linux-tegra@vger.kernel.org
Cc:     Andrew Morton <akpm@linux-foundation.org>,
        Linus Torvalds <torvalds@linux-foundation.org>
Subject: Re: [RFT v2 21/29] memory: omap-gpmc: Remove GPMC_SET_ONE_CD_MAX
 macro for safety
Message-ID: <20200817183311.GD3464@kozik-lap>
References: <20200724074038.5597-1-krzk@kernel.org>
 <20200724074038.5597-22-krzk@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20200724074038.5597-22-krzk@kernel.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Fri, Jul 24, 2020 at 09:40:30AM +0200, Krzysztof Kozlowski wrote:
> The GPMC_SET_ONE_CD_MAX macro uses return statement and variable 'cs'
> coming from called scope.  This is not a good practice.  Also
> checkpatch complained:
> 
>     WARNING: Macros with flow control statements should be avoided
>     ERROR: Macros starting with if should be enclosed by a do - while
>         loop to avoid possible if/else logic defects
> 
> Since GPMC_SET_ONE_CD_MAX macro just calls one function, it can be open
> coded.  The difference with original code is that function will exit on
> error not after every register set, but after a group of sets.
> 
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
> 
> ---
> 

Applied.

Best regards,
Krzysztof


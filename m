Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C7A7622C7B1
	for <lists+linux-omap@lfdr.de>; Fri, 24 Jul 2020 16:16:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726583AbgGXOQl (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 24 Jul 2020 10:16:41 -0400
Received: from mail-ed1-f67.google.com ([209.85.208.67]:44937 "EHLO
        mail-ed1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726317AbgGXOQl (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Fri, 24 Jul 2020 10:16:41 -0400
Received: by mail-ed1-f67.google.com with SMTP id by13so7123234edb.11;
        Fri, 24 Jul 2020 07:16:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=0sb81io14/iZEElRAIKtQbO/0LNyji9cw16nJ0jDSPU=;
        b=U4sXtDjURRyG/D7k4xTE5TEmxatK1efr8nujMlYIIUbEnyuNuEbqOHH6zbhzjwCBUD
         MkMBV2ykZahcUsltZj0xHelVP4k4FkIb7FfeqRHQLpqxNu5wCM9zqORnCdU+5IJrzdz1
         G1DG0be4Gf6u9gSUkxoChtGc+NTsifbPq8UBUF1RFbhq7TcZhfMHSlu6G4uuIs5sgTfV
         ZiCIHdIVk4LVDfiRFt9MmCYFVrxvowFXYWiAM8s8ArmZTfeBtvru27Zytn6WyYNQRV0o
         BZSzv1yU2I8h+DasnMCTuTjF815OMlxI15Wf0YvpEpDLZSnQibgaaDrwK9XzrsRNLGYG
         LIIA==
X-Gm-Message-State: AOAM530n4ZJ17PuGIbmm2BYvyJl1p7RFqOtrVzuFKGXwD6I4DkvUayjp
        czDobmYUjPcHOvAgtnnuZeM=
X-Google-Smtp-Source: ABdhPJxZz5FjCvbGUaml5g0kUTy9tq4Ud3q1Jr1TK7yBGK4mPmuoJK+Z/MVfq8HjdZ2+i6JCiMoMWQ==
X-Received: by 2002:a05:6402:2064:: with SMTP id bd4mr9018052edb.180.1595600198137;
        Fri, 24 Jul 2020 07:16:38 -0700 (PDT)
Received: from kozik-lap ([194.230.155.213])
        by smtp.googlemail.com with ESMTPSA id v24sm773066eds.71.2020.07.24.07.16.35
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 24 Jul 2020 07:16:37 -0700 (PDT)
Date:   Fri, 24 Jul 2020 16:16:34 +0200
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
Subject: Re: [PATCH v2 22/29] memory: omap-gpmc: Fix whitespace issue
Message-ID: <20200724141634.GD10663@kozik-lap>
References: <20200724074038.5597-1-krzk@kernel.org>
 <20200724074038.5597-23-krzk@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20200724074038.5597-23-krzk@kernel.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Fri, Jul 24, 2020 at 09:40:31AM +0200, Krzysztof Kozlowski wrote:
> Fix minor whitespace and comment issues.  No functional changes.
> 
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
> 
> ---

Applied (and part of pull request to arm-soc).

For the other omap-gpmc testing is welcomed.

Best regards,
Krzysztof

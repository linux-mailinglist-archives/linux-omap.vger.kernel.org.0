Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E413A2471B7
	for <lists+linux-omap@lfdr.de>; Mon, 17 Aug 2020 20:33:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388179AbgHQScl (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 17 Aug 2020 14:32:41 -0400
Received: from mail-ed1-f67.google.com ([209.85.208.67]:40834 "EHLO
        mail-ed1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2391139AbgHQSc0 (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Mon, 17 Aug 2020 14:32:26 -0400
Received: by mail-ed1-f67.google.com with SMTP id a14so13121322edx.7;
        Mon, 17 Aug 2020 11:32:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=RjGzQA0sj9LgMuBKGfdljJoHuJrThb6OxdJKZW4mtwQ=;
        b=NQDjUucxYNwwzfwMzIBnm5U6c+f3EFuNB/gCWWQjCrUCB0prnKeItuc6jVEsbcmbCh
         o+7TEEYK0klpVpktK82Zqf0LjUUFuHf8uVzinHRRjy/6++ITNJR2lq1t39wa0qKi+FRL
         88/4IRqY9UhsHIZubDSP8ZgraqTWCLV/XWndHFgncTt3YQ9EIRGrHZh9nM2T+uvBzui2
         4LLpdeUQSm4tbf7P6Gsj3bHDWxPHNS4IZbGEoGUuR5MfJYwyiVLbmrI9iQXL3rUpAL3u
         X7IPCngjzw5GdjpXjreHNZqTMBY0af9Z0pJS1yhEd0Y+yQkeBTDQItG5h/yCfJD/rGD7
         KjDA==
X-Gm-Message-State: AOAM531L0gOkJdn3esy1ppL678aI4P6qFgkWP3EKHKczSF1f6BAvwZQl
        JKq9xmSaVfHVYGEt78tvTGI=
X-Google-Smtp-Source: ABdhPJx9SUZGr2fbcqQFiUQhvkRu1lcumoJycjlLpHc32PzeyqMQGfQ7Wto1oEAieJGVwl6Ll2Ot+Q==
X-Received: by 2002:aa7:c382:: with SMTP id k2mr15730132edq.249.1597689144539;
        Mon, 17 Aug 2020 11:32:24 -0700 (PDT)
Received: from kozik-lap ([194.230.155.216])
        by smtp.googlemail.com with ESMTPSA id q11sm14191537edn.12.2020.08.17.11.32.22
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 17 Aug 2020 11:32:23 -0700 (PDT)
Date:   Mon, 17 Aug 2020 20:32:21 +0200
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
Subject: Re: [RFT v2 20/29] memory: omap-gpmc: Return meaningful error codes
 in gpmc_cs_set_timings()
Message-ID: <20200817183221.GC3464@kozik-lap>
References: <20200724074038.5597-1-krzk@kernel.org>
 <20200724074038.5597-21-krzk@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20200724074038.5597-21-krzk@kernel.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Fri, Jul 24, 2020 at 09:40:29AM +0200, Krzysztof Kozlowski wrote:
> The callers of gpmc_cs_set_timings() expect to receive -ERRNO on errors
> and they pass further what they have received.
> 
> However gpmc_cs_set_timings() was returning -1 (equal to -EPERM) which
> does not make sense in this context.
> 
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
> 
> ---

Applied to drivers/memory tree.

Best regards,
Krzysztof

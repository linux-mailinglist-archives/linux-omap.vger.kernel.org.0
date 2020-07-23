Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7542E22AB24
	for <lists+linux-omap@lfdr.de>; Thu, 23 Jul 2020 10:55:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726303AbgGWIzj (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 23 Jul 2020 04:55:39 -0400
Received: from mail-ej1-f67.google.com ([209.85.218.67]:40938 "EHLO
        mail-ej1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725911AbgGWIzj (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Thu, 23 Jul 2020 04:55:39 -0400
Received: by mail-ej1-f67.google.com with SMTP id o18so5514928eje.7;
        Thu, 23 Jul 2020 01:55:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=Xt5+vxpGC9nM/ZHsj3r5gI/nmTDmk9F2oBeOZtyGPQM=;
        b=ddpnUlIUIV5C0ItojdvfTtAPdsnBCDQMXoF/G1SjnTGBKiFG8k3OVikaOxUm19odph
         VEFVVmtP/eIlYfyKZmTPAMxK9gW1O/MLXDxdtie4Q9+xMGEieYxirNthaFgrIhC41sig
         ubX6nkZiF2qCHGc0ghQf6rJdLPIrWWynuYsGef8ztTi8ThASG+r8jGuR7cCldme+GXSd
         aZxhSnecXiH0HZn6FbRiqKkg6XY3xG7O/E96nXsPeMHMedVxtPw58TcwbnrYuzxNXjQE
         TNPpHsVKkUXNC5ACLxjnGyCj8ITPMN/EdiMiJH5odImulHMyx3GFuDhKBiVjA/2LpGsZ
         JhBQ==
X-Gm-Message-State: AOAM533luptVUqF4R1RVBDBQVtqaDwYwrkDBiLqqUMQVULSFzffhYXjC
        bjZX9BMt0RRZ8nnDHBFhrEvrC641jr0=
X-Google-Smtp-Source: ABdhPJwRP+wjzC0Ys2mHygLb4mxZAtf0iTg0JkShIGi/qXx7US6BV7vrg2I5N8csKyuByvVrRm5SwQ==
X-Received: by 2002:a17:906:414c:: with SMTP id l12mr3469617ejk.417.1595494536809;
        Thu, 23 Jul 2020 01:55:36 -0700 (PDT)
Received: from kozik-lap ([194.230.155.213])
        by smtp.googlemail.com with ESMTPSA id jo25sm1541668ejb.116.2020.07.23.01.55.34
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 23 Jul 2020 01:55:36 -0700 (PDT)
Date:   Thu, 23 Jul 2020 10:55:33 +0200
From:   Krzysztof Kozlowski <krzk@kernel.org>
To:     Arnd Bergmann <arnd@arndb.de>
Cc:     Olof Johansson <olof@lixom.net>, arm-soc <arm@kernel.org>,
        SoC Team <soc@kernel.org>, Markus Mayer <mmayer@broadcom.com>,
        bcm-kernel-feedback-list <bcm-kernel-feedback-list@broadcom.com>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Santosh Shilimkar <ssantosh@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Roger Quadros <rogerq@ti.com>,
        Tony Lindgren <tony@atomide.com>,
        Vladimir Zapolskiy <vz@mleia.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        "moderated list:ARM/Mediatek SoC..." 
        <linux-mediatek@lists.infradead.org>,
        linux-omap <linux-omap@vger.kernel.org>,
        "open list:TEGRA ARCHITECTURE SUPPORT" <linux-tegra@vger.kernel.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [PATCH 18/23] memory: mtk-smi: Add argument to function
 definition
Message-ID: <20200723085533.GA25935@kozik-lap>
References: <20200723073744.13400-1-krzk@kernel.org>
 <20200723073744.13400-19-krzk@kernel.org>
 <CAK8P3a1TSTX9ATUuyWyqJ1xtd6GP13JM-RQkhGCi1BSTiM9X9A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAK8P3a1TSTX9ATUuyWyqJ1xtd6GP13JM-RQkhGCi1BSTiM9X9A@mail.gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Thu, Jul 23, 2020 at 10:50:08AM +0200, Arnd Bergmann wrote:
> On Thu, Jul 23, 2020 at 9:39 AM Krzysztof Kozlowski <krzk@kernel.org> wrote:
> >
> > Fix checkpatch warning:
> >     WARNING: function definition argument 'struct device *' should also have an identifier name
> >
> > Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
> 
> Is this a bug in checkpatch? I don't see why it should warn about this,
> as there is no function definition here.
> 
> Your change is clearly harmless, but I wonder if we should fix
> checkpatch instead.

Good point. If this were not a warning, I would ignore it. However still
the common practice is to add arguments to such type definitions as it
helps to describe the type.

Best regards,
Krzysztof

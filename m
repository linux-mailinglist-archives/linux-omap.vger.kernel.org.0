Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0BB0922BEC9
	for <lists+linux-omap@lfdr.de>; Fri, 24 Jul 2020 09:15:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726878AbgGXHPj (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 24 Jul 2020 03:15:39 -0400
Received: from mail-ej1-f67.google.com ([209.85.218.67]:44640 "EHLO
        mail-ej1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726567AbgGXHPi (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Fri, 24 Jul 2020 03:15:38 -0400
Received: by mail-ej1-f67.google.com with SMTP id ga4so8901844ejb.11;
        Fri, 24 Jul 2020 00:15:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=kb0NMIWA8NMC9OCkXCwQpZanLpUA9SPrAHge49T1PVs=;
        b=lBWJFQYsSBxsqWcrEu4b/YfigHgRdG14K5XgQ1fSQCZCbA2RmD4LJu6NtATnKxngQa
         lzR/dAq6kV8Gir3fz0mj0LhXB0KUXMudsIEr/mcWDyjLHC56LSsVVqAfwxl/zqxrVD93
         YnzC5WJaDx3J2Xf9MDdbf7uXdRXMtqo7VH/BwcRtFQaC5bvVPpZeMrhS7EhO3IgKhrVd
         x3l0J2WwS/MNnD1LjYOjUaNeBOAYwWdATQYY6tqwXoANb8jX1bg23+y1Q08aIcqX4bd4
         FvfwhxWhEhmwhA0aKP1t8dxM+yZ0EDmkaOiFmFRvvl9N6ErNTIAV10OOdvk1WKRBx6Eg
         sdjQ==
X-Gm-Message-State: AOAM5302jtug++pR+o2rtTmzlSg+RxWjVDTGBgc3CaYoCNxfbGluxU9Q
        IcaNT3HPdboD8pB1ZdU0A5E=
X-Google-Smtp-Source: ABdhPJzqgO6qxeTTZTDa89MI0CgYxEaP3SeQEudnyocZKpAeuj1R0CEq2QVJrGBSwuvtwplZBmRarg==
X-Received: by 2002:a17:906:1a16:: with SMTP id i22mr8067074ejf.439.1595574936524;
        Fri, 24 Jul 2020 00:15:36 -0700 (PDT)
Received: from kozik-lap ([194.230.155.213])
        by smtp.googlemail.com with ESMTPSA id fi29sm90068ejb.83.2020.07.24.00.15.33
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 24 Jul 2020 00:15:35 -0700 (PDT)
Date:   Fri, 24 Jul 2020 09:15:32 +0200
From:   Krzysztof Kozlowski <krzk@kernel.org>
To:     Florian Fainelli <f.fainelli@gmail.com>
Cc:     Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>,
        arm@kernel.org, soc@kernel.org, Markus Mayer <mmayer@broadcom.com>,
        bcm-kernel-feedback-list@broadcom.com,
        Santosh Shilimkar <ssantosh@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Roger Quadros <rogerq@ti.com>,
        Tony Lindgren <tony@atomide.com>,
        Vladimir Zapolskiy <vz@mleia.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-omap@vger.kernel.org,
        linux-tegra@vger.kernel.org,
        Andrew Morton <akpm@linux-foundation.org>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [PATCH 23/23] MAINTAINERS: Add Krzysztof Kozlowski as maintainer
 of memory controllers
Message-ID: <20200724071532.GA3087@kozik-lap>
References: <20200723073744.13400-1-krzk@kernel.org>
 <20200723073744.13400-24-krzk@kernel.org>
 <afee0362-e9b9-26da-04e2-136a8599bc79@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <afee0362-e9b9-26da-04e2-136a8599bc79@gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Thu, Jul 23, 2020 at 10:12:36AM -0700, Florian Fainelli wrote:
> On 7/23/20 12:37 AM, Krzysztof Kozlowski wrote:
> > The specific drivers in drivers/memory usually go via architecture (e.g.
> > ARM SoC) maintainers but the generic parts (of_memory.[ch]) lacked any
> > care.
> > 
> > Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
> 
> Acked-by: Florian Fainelli <f.fainelli@gmail.com>
> 
> What does this mean for specific drivers? For instance I tend to send
> updates to brcmstb_dpfe.c through the Broadcom ARM SoC pull requests,
> shall I continue to do this, or are you going to send memory controller
> subsystem pull requests including that file in the future?

If that's okay, I intend to take the drivers patches as well. I will
rephrase the commit message.

Thanks for the feddback.

Best regards,
Krzysztof


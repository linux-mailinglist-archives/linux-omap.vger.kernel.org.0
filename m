Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 729102F5C79
	for <lists+linux-omap@lfdr.de>; Thu, 14 Jan 2021 09:33:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727155AbhANId1 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 14 Jan 2021 03:33:27 -0500
Received: from mail-lf1-f41.google.com ([209.85.167.41]:43224 "EHLO
        mail-lf1-f41.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726742AbhANId1 (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Thu, 14 Jan 2021 03:33:27 -0500
Received: by mail-lf1-f41.google.com with SMTP id 23so6843884lfg.10;
        Thu, 14 Jan 2021 00:33:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:reply-to:to:cc
         :in-reply-to:references:mime-version:date:user-agent
         :content-transfer-encoding;
        bh=/E2gfttx8InW5KuvsG4jR8cRKvSuRT8AKK9KJ0UJcDE=;
        b=Qnn91Zx4kGJaJHHWaCl20hwUBdj2iPpOEY9axW1e9nYBCh5MsqHVVYVqKPQdH7+sFJ
         FmlYPyISIN2HLMq37LkLRe7Yo17gWfyjWEhzs9vqcigQfGnxDCeFKjM7IXb6BnXTfcNk
         CfLdpo7FFMFRulcUmx0MeqUCnonyEFKXnFRfK5qJyRL+8lm5ESOIOIn9C5w6HK7TQuwu
         LRxMx3o+gAsmbU5keDAGwymP1+xla3Ocm8/h2wzZKxWD+kxHQYnsJ5t0JTZItHOQNKLd
         WKS+Ukdp9gO2Q6l3Y+JoiQUKyZTkDjUK5Eyjsl7ufh+QZLWO/gcdn8rMQF6qpN954uhD
         AA5Q==
X-Gm-Message-State: AOAM531tPM9wNVLY9WqQXJOpymOQ5WNz6AMnfSgEqdu0n6VQMpXD1UIL
        OXR0DtK+k8pXuTKY/NFaCJw=
X-Google-Smtp-Source: ABdhPJy5J1eyEWB9gh/6pUELoYyVPCVXMajYQFhOZAa8hlzgXwrVhHeFBteQeKeRpbGv40eH+LStqw==
X-Received: by 2002:a05:6512:3194:: with SMTP id i20mr2825027lfe.283.1610613164688;
        Thu, 14 Jan 2021 00:32:44 -0800 (PST)
Received: from localhost.localdomain (62-78-225-252.bb.dnainternet.fi. [62.78.225.252])
        by smtp.gmail.com with ESMTPSA id q28sm478090lfm.86.2021.01.14.00.32.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Jan 2021 00:32:44 -0800 (PST)
Message-ID: <306a4d4d7e26478dfc6c8c3eb40e1746ae471805.camel@fi.rohmeurope.com>
Subject: Re: [PATCH 13/18] ARM: dts: Use simple-pm-bus for genpd for am3
 l4_wkup
From:   Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
Reply-To: matti.vaittinen@fi.rohmeurope.com
To:     Tony Lindgren <tony@atomide.com>
Cc:     "geert@linux-m68k.org" <geert@linux-m68k.org>,
        "rogerq@ti.com" <rogerq@ti.com>, "s-anna@ti.com" <s-anna@ti.com>,
        "bcousson@baylibre.com" <bcousson@baylibre.com>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "d-gerlach@ti.com" <d-gerlach@ti.com>,
        "linux-omap@vger.kernel.org" <linux-omap@vger.kernel.org>,
        "t-kristo@ti.com" <t-kristo@ti.com>
In-Reply-To: <X//799pSjH9bL39s@atomide.com>
References: <20201026112222.56894-1-tony@atomide.com>
         <20201026112222.56894-14-tony@atomide.com>
         <CAMuHMdWribr=eg1LkKce=Hamm+JwSz5UFEXLKUmKkqqz1RpL_w@mail.gmail.com>
         <X/8ei0o9ULpRdx7T@atomide.com>
         <CAMuHMdW+y5Y+0U1beebq7EGiarBKYdHszL+vW5r4xG6HBspVgQ@mail.gmail.com>
         <X/8kDzoADvcnNHxC@atomide.com> <X/8tz/2v4bnbF0TZ@atomide.com>
         <X//wx/oSTpXKpY75@atomide.com>
         <1c7301145600dabbb95402c7df0cf00b7bdd7fdd.camel@fi.rohmeurope.com>
         <X//799pSjH9bL39s@atomide.com>
Content-Type: text/plain; charset="UTF-8"
MIME-Version: 1.0
Date:   Thu, 14 Jan 2021 10:32:40 +0200
User-Agent: Evolution 3.34.4 (3.34.4-1.fc31) 
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Thanks Tony,

On Thu, 2021-01-14 at 10:08 +0200, Tony Lindgren wrote:
> * Vaittinen, Matti <Matti.Vaittinen@fi.rohmeurope.com> [210114
> 07:58]:
> > I do also experience the boot problem described by Geert.
> > 
> > Head being:
> > b0625afe305253d0831af9289b37c906c18a781b
> > ARM: OMAP2+: Drop legacy platform data for am3 mpuss
> > 
> > => BBB boots Ok.
> > 
> > Head being:
> > 5a230524f87926f24d637fe62fd689f7f86f5036
> > ARM: dts: Use simple-pm-bus for genpd for am3 l4_wkup
> > 
> > => BBB boot fails. (I don't have any debug parameters => last thing
> > I
> > see in UART is from uBoot:
> 
> Looking at the .config Geert sent me, at least CONFIG_SIMPLE_PM_BUS=y
> is now needed, and probably should be selected or default y for
> omaps.
> 
> Adding that removes the -512 errors at least that I started seeing
> with
> Geert's config too.
> 
> Can you guys check if adding CONFIG_SIMPLE_PM_BUS=y fixes the
> problem?

After enabling CONFIG_SIMPLE_PM_BUS
5a230524f87926f24d637fe62fd689f7f86f5036
ARM: dts: Use simple-pm-bus for genpd for am3 l4_wkup


boots Ok :) Sounds like it should be enabled on BBB by default.

Best Regards
	Matti Vaittinen


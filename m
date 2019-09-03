Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1D329A6AA7
	for <lists+linux-omap@lfdr.de>; Tue,  3 Sep 2019 16:01:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727107AbfICOBy (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 3 Sep 2019 10:01:54 -0400
Received: from mail-qk1-f196.google.com ([209.85.222.196]:35870 "EHLO
        mail-qk1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725782AbfICOBy (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 3 Sep 2019 10:01:54 -0400
Received: by mail-qk1-f196.google.com with SMTP id s18so4990338qkj.3
        for <linux-omap@vger.kernel.org>; Tue, 03 Sep 2019 07:01:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Okv1zvAd1ldoCpyTNAaJ+bu2tE+K7RIrffUiTBuevuw=;
        b=lp+w39rEr9iYkHVviiHygHnUGwjlHZ56UiUrl2/NvyXZY2yTGRpbXHYU55njLW3gHZ
         QQnyD31LQQ7usRybI8Q8OPML8Fx5C2cRF8A5jKsJI95UdMYQWfuIS2OfSs6l2YgPf3t4
         ZFVqOEKYUEQCEJPbjAIlf1uTuTLzdDxcvX5Oi+Mh/UPPAkz9L4DXRA9bXaxLBfykyrsl
         1VMw3X09jlnzxNzJHn2ouzzJa96x3CnW8DtwXP+9wX2X2R3JX0UhIe8qiDuKQOOUum6U
         19D6Mm2gVKzQq0hZOEr9dKBrRK+Q3YNDfV4seVH6p4mHnv9IPZ27hR80SLPMrWxwNAuW
         wCTA==
X-Gm-Message-State: APjAAAV5u+XpzNZtqfc770C1rLLx4joXaCGpHSPEAtQfYdE+z4fJ8mvm
        TdSu5gB9vg24YeNaY4ZWU0y4Li83ebezQ1ZSle8=
X-Google-Smtp-Source: APXvYqwnYV6Q1VYs3bLAj6j0OCrXMgkORiMcHL+FkNWNAfswMiQNrIgk/qlq/ZtfE+s+MKED0F0rQi7ZNVmB9wZD+0Q=
X-Received: by 2002:a37:4fcf:: with SMTP id d198mr33813224qkb.394.1567519313258;
 Tue, 03 Sep 2019 07:01:53 -0700 (PDT)
MIME-Version: 1.0
References: <pull-1566599057-142651@atomide.com> <pull-1566599057-142651@atomide.com-2>
In-Reply-To: <pull-1566599057-142651@atomide.com-2>
From:   Arnd Bergmann <arnd@arndb.de>
Date:   Tue, 3 Sep 2019 16:01:37 +0200
Message-ID: <CAK8P3a3SQKV3qCebMpvUgPZE5DVjwfJ-pub=FWwbnyY4m=iVeQ@mail.gmail.com>
Subject: Re: [GIT PULL 2/2] dts changes for omap variants for v5.4
To:     Tony Lindgren <tony@atomide.com>
Cc:     SoC Team <soc@kernel.org>, arm-soc <arm@kernel.org>,
        linux-omap <linux-omap@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Sat, Aug 24, 2019 at 12:24 AM Tony Lindgren <tony@atomide.com> wrote:
> ----------------------------------------------------------------
> dts changes for omap variants for v5.4
>
> Remove regulator-boot-off properties that we never had in the mainline
> kernel so they won't do anything. We add stdout-path for gta04, and
> make am335x-boneblue use am335x-osd335x-common.dtsi file.

Pulled into arm/dt, thanks!

       Arnd

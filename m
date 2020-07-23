Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B8B0622B48F
	for <lists+linux-omap@lfdr.de>; Thu, 23 Jul 2020 19:15:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729811AbgGWRPs (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 23 Jul 2020 13:15:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46854 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726761AbgGWRPr (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Thu, 23 Jul 2020 13:15:47 -0400
Received: from mail-qk1-x741.google.com (mail-qk1-x741.google.com [IPv6:2607:f8b0:4864:20::741])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BA61BC0619E2
        for <linux-omap@vger.kernel.org>; Thu, 23 Jul 2020 10:15:47 -0700 (PDT)
Received: by mail-qk1-x741.google.com with SMTP id h7so6060418qkk.7
        for <linux-omap@vger.kernel.org>; Thu, 23 Jul 2020 10:15:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=JXiuwKSxH1v6t1t/ryYYU7zLgRgpgLMrl8o3usa+ml4=;
        b=K+SnKxwUrjhMdkKMznvv0/mSZpVVpR59yG77Q31rc69sjsc1uY1h2B4N81OGYgZcS1
         fsFtjzCQh4qQJSYBpVJxnJiFdI0biFvC+sGyjDB0cDY0hG11MHJBwW2SK2RI7m2/rwyS
         v1bd5wbArHaOuX4jaoWOMdBC00HeEJmfUwO1k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=JXiuwKSxH1v6t1t/ryYYU7zLgRgpgLMrl8o3usa+ml4=;
        b=pW6l+8sBYtVhKizunWR4c+FYhrWAN40As2FdHiuwj+EfhVHbK3ZPborvsFk37kB7GU
         gJK+GZMKpowCNPOjqGV38AZkOQ/t32uVs8tk6aMEcYThAbp2SpfWkv23vmeNkw5oAEUA
         k6mGFBI6EA52ks6EsO0Rotckn3mgbDXBgBjmtfZTa40QSER9YtSwtvRLKD+7FCqJl0uT
         PkJ5N9BZh2KVtxkdw4DgRbv2APFYBHTSgveu+RsfHKohDpjeAQrjy5gfkt6m4pp/p3sq
         1X0uQmr4knwX5HQAgT5YmeomEuTwD8GNDCB/pk/y4QJ24VHNbF228L3yMPyDomoFWDEg
         e2Vg==
X-Gm-Message-State: AOAM530HZyOu4ffsEeaDZ8BZx5LuJBAIWfNT9Ox2iNyJGnbFLyZY/+Ra
        Cs8oQv/zi4PtoZpKBSdlDMhPGO7IYFeIYnYss7WuXA==
X-Google-Smtp-Source: ABdhPJxTfnoxWQUWdTg8raMcFvzXp1cWiOq8kQMMi+BDEmI/sCV1IYxPpZLXjsosKPeDkbkDYTHj+k9jFHSSpLw6ss4=
X-Received: by 2002:ae9:e857:: with SMTP id a84mr6649837qkg.100.1595524546846;
 Thu, 23 Jul 2020 10:15:46 -0700 (PDT)
MIME-Version: 1.0
References: <20200723073744.13400-1-krzk@kernel.org> <20200723073744.13400-17-krzk@kernel.org>
 <b9519b7f-9cf0-3715-bca9-05905035eada@gmail.com>
In-Reply-To: <b9519b7f-9cf0-3715-bca9-05905035eada@gmail.com>
From:   Markus Mayer <mmayer@broadcom.com>
Date:   Thu, 23 Jul 2020 10:15:36 -0700
Message-ID: <CAGt4E5v3mbY_S2Q=Tq5ZKSY450weu9kFZ9R3bkJ1=3VPobZGsg@mail.gmail.com>
Subject: Re: [PATCH 16/23] memory: brcmstb_dpfe: Constify the contents of string
To:     Florian Fainelli <f.fainelli@gmail.com>
Cc:     Krzysztof Kozlowski <krzk@kernel.org>,
        Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>,
        arm@kernel.org, soc@kernel.org,
        BCM Kernel Feedback <bcm-kernel-feedback-list@broadcom.com>,
        Santosh Shilimkar <ssantosh@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Roger Quadros <rogerq@ti.com>,
        Tony Lindgren <tony@atomide.com>,
        Vladimir Zapolskiy <vz@mleia.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Linux Kernel <linux-kernel@vger.kernel.org>,
        Linux ARM Kernel <linux-arm-kernel@lists.infradead.org>,
        linux-mediatek@lists.infradead.org, linux-omap@vger.kernel.org,
        linux-tegra@vger.kernel.org,
        Andrew Morton <akpm@linux-foundation.org>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Thu, 23 Jul 2020 at 10:11, Florian Fainelli <f.fainelli@gmail.com> wrote:
>
> On 7/23/20 12:37 AM, Krzysztof Kozlowski wrote:
> > The string itself can be made const for safety.
> >
> > Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
>
> Acked-by: Florian Fainelli <f.fainelli@gmail.com>

Acked-by: Markus Mayer <mmayer@broadcom.com>

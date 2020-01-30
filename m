Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C97F014DDEB
	for <lists+linux-omap@lfdr.de>; Thu, 30 Jan 2020 16:34:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727158AbgA3PeY (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 30 Jan 2020 10:34:24 -0500
Received: from mail-pg1-f195.google.com ([209.85.215.195]:40343 "EHLO
        mail-pg1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726948AbgA3PeY (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Thu, 30 Jan 2020 10:34:24 -0500
Received: by mail-pg1-f195.google.com with SMTP id k25so1828070pgt.7;
        Thu, 30 Jan 2020 07:34:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=InrNXti2tqCcgdnGdrLOWWm7wwHdQlyKW3JTIC/mJg0=;
        b=QFVo/muvtC0B6YIUO9y0xdoojxpuOFjX+qqo2YlJf53v2Gk6pJQsUNVZ4SXXSbVnnX
         N80G3hHiF4ARB3umz0Wu5SdiQiizhRz9wCUYaN03fP4i0RFEbVMjFXpqQMyMAguWFQit
         EI13GLwLJ/F5/OqFXMvHtZbKSY6gmxuyuacNovVFxahOHVoiVyoSyz2cIsrNG2sAtRD8
         Qpcu2GRpvFh7RuULb82Qc14M6mAM4t7JyT5bsgoC73WGc4g+Rqj2kfpBkd6lemq/7JmG
         44O1Oq7r5/KZhTWjpy7Y5VDqJZuH9yB/BKSlYyNzhhFHZCdEeQrMR38Ru6EEPbQ0ah7p
         aHYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=InrNXti2tqCcgdnGdrLOWWm7wwHdQlyKW3JTIC/mJg0=;
        b=XMgoYlPPCAnO2ls4iWI4yEvWBJoj0HLiU/U++X99C06dVkxN0HdwZfWJRAb+N6pLYv
         lapTtKfMuu6fbvV2w/1s2BN6E05SttPbEyvAGsOS0S+lH+yV7ywIEdRSqI41me9JKR5W
         rKi7pxThzqh60kgSSS6PiQck1pfl6bZBJbx96gO3q1vQ06dnQOSlzrPSd031HvubTa8W
         OHWXVWpEWPViAmI6ghnAy7CMpzBOXdXWkMglw2Gb1Krc4PtYKzvSNyt6p3z6J09siwxB
         d7fKf8PA/94zdL4ZibQRwmpb5d/iFDh/NG/d6bLc8VjZb6sBBH18f57hcXglmoBZWPZe
         XUUw==
X-Gm-Message-State: APjAAAXMu9OaxDytPXDIb5FhXvLbHMsbi0PXoEc5g8O/8GwkgCeLKJ+I
        JgySsUj0iYH41xsVbnj59cEkOm3Eu8mXk6HORgw=
X-Google-Smtp-Source: APXvYqxVfCmeNmg1JmwHBQ7U3+tNZs6aDkq/CssViwtzjKsDbuZf7DhdPYWehXmBapOg3jXG2EdG0Z8BxH5TGreo6D0=
X-Received: by 2002:a63:5a23:: with SMTP id o35mr5262942pgb.4.1580398463707;
 Thu, 30 Jan 2020 07:34:23 -0800 (PST)
MIME-Version: 1.0
References: <20200127231208.1443-1-s-anna@ti.com>
In-Reply-To: <20200127231208.1443-1-s-anna@ti.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Thu, 30 Jan 2020 17:34:15 +0200
Message-ID: <CAHp75VfaOfBZYjQa960keORW=VjOn2PdwoYpJMG7SsN83daSJg@mail.gmail.com>
Subject: Re: [PATCH v2] mfd: syscon: Use a unique name with regmap_config
To:     Suman Anna <s-anna@ti.com>
Cc:     Lee Jones <lee.jones@linaro.org>, Arnd Bergmann <arnd@arndb.de>,
        David Lechner <david@lechnology.com>,
        Tony Lindgren <tony@atomide.com>,
        Roger Quadros <rogerq@ti.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>,
        Linux OMAP Mailing List <linux-omap@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Tue, Jan 28, 2020 at 1:14 AM Suman Anna <s-anna@ti.com> wrote:
>
> The DT node full name is currently being used in regmap_config
> which in turn is used to create the regmap debugfs directories.
> This name however is not guaranteed to be unique and the regmap
> debugfs registration can fail in the cases where the syscon nodes
> have the same unit-address but are present in different DT node
> hierarchies. Replace this logic using the syscon reg resource
> address instead (inspired from logic used while creating platform
> devices) to ensure a unique name is given for each syscon.

> -       syscon_config.name = of_node_full_name(np);
> +       syscon_config.name = kasprintf(GFP_KERNEL, "%pOFn@%llx", np,
> +                                      (u64)res.start);

Explicit castings in printf() usually tell us that something is not okay.
Yes, for resource_size_t we have %pa.

On top of that, I would rather see %pfwn to avoid modification for
other fwnode types.

-- 
With Best Regards,
Andy Shevchenko

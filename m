Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 42CC414E42B
	for <lists+linux-omap@lfdr.de>; Thu, 30 Jan 2020 21:43:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727089AbgA3Ung (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 30 Jan 2020 15:43:36 -0500
Received: from mail-pf1-f193.google.com ([209.85.210.193]:38046 "EHLO
        mail-pf1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726514AbgA3Ung (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Thu, 30 Jan 2020 15:43:36 -0500
Received: by mail-pf1-f193.google.com with SMTP id x185so2092063pfc.5;
        Thu, 30 Jan 2020 12:43:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=0dxYpvbP3+MitgaCJiQJwbd1PLgONyG5Ng5sN3hHzdc=;
        b=AdqtidcT3UyXX4tOAnsEgclFfQ+sfOYmLxjGeZOjbsO1dNlm6Hz+JFf3TvhvlJO9Wb
         5BJ2UbFzD2Se8VVQoiKvNLl0DnbchDFaZdaJqxkSyQxgvFmmjH9a3K++2MGLrghdgSRL
         Vh6blAXKV1tyNP/0cZ1GHUeWdo4iAjFITjZieOeI/feu6Uws5jf60Iaex3J4hmyys4V8
         oXZEaG83wKW9I9CeNi1f1M5obf9FmqBLfuvYu9FsTKePYFap4zG8nLNrwGg/OkySyAdQ
         WSUjOe8GXmKd6TR2AZOEvfBnzl/THm8g8oIRZhLAjGg1Ydqa7PoaL66Eq2VA/ZgCt4L7
         aV8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=0dxYpvbP3+MitgaCJiQJwbd1PLgONyG5Ng5sN3hHzdc=;
        b=XdxFJ5RX7NsbG5ey3QHLsNhxorO62/EhYyfWqKxcN0F8oBX9AWqY914ge9YBsA9vBA
         7Qrc1eotq6b10R4pxCm4kWDh6Avx7JqUn6SA4K1G1Ek0WfU1r8+Y2vgsL5kQYnqEbk+w
         LJebzO8U8LslpVa/VqWvCCJAuJXfD7HtdpRbQIc42e/DSZ1eURODbe8P1W+wt9IEdrwU
         Kk6KNOYGRuPR5YJBtL4eXQ+5a+5Q8oNfUYI10iOGr2Cz8E7FzW6/hECH03hUBAiFTH/i
         uDM0/hYna/Apf6pDO6auMt68xnpR0g//TXgYPVS+NICAnZ7kJ6ed7chFhOFsK0QZ1qAA
         IaYQ==
X-Gm-Message-State: APjAAAWUGqArfMf5XS86SMQQmxJ+hq96Jzj/vd1PlAGRfMDExfhNdmcz
        IZRD3oDSoqPXybCKZ6sG1cDVL68O+f55nFiIqvA=
X-Google-Smtp-Source: APXvYqxtungvuJiW+tQaf+Q4OiC4fCw/m5Y6NFIJtHQbGTC2Ce2BKAtg6nHhDwrtGEnA52l43PrAt1t3SwmrQzwCwg4=
X-Received: by 2002:a65:5242:: with SMTP id q2mr6412421pgp.74.1580417015788;
 Thu, 30 Jan 2020 12:43:35 -0800 (PST)
MIME-Version: 1.0
References: <20200127231208.1443-1-s-anna@ti.com> <CAHp75VfaOfBZYjQa960keORW=VjOn2PdwoYpJMG7SsN83daSJg@mail.gmail.com>
 <99a04c52-1ff6-1611-5cf6-2c71b810ba43@ti.com>
In-Reply-To: <99a04c52-1ff6-1611-5cf6-2c71b810ba43@ti.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Thu, 30 Jan 2020 22:43:25 +0200
Message-ID: <CAHp75VfhLDpuJD+ftdEWt3bwooRD5U=KfOnKZeKm9d4N21HOtw@mail.gmail.com>
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

On Thu, Jan 30, 2020 at 7:09 PM Suman Anna <s-anna@ti.com> wrote:
> On 1/30/20 9:34 AM, Andy Shevchenko wrote:
> > On Tue, Jan 28, 2020 at 1:14 AM Suman Anna <s-anna@ti.com> wrote:

...

> >> -       syscon_config.name = of_node_full_name(np);
> >> +       syscon_config.name = kasprintf(GFP_KERNEL, "%pOFn@%llx", np,
> >> +                                      (u64)res.start);
> >
> > Explicit castings in printf() usually tell us that something is not okay.
>
> Yes, I agree in general.
>
> > Yes, for resource_size_t we have %pa.
>
> And that was the first thing I tried when doing v2, before moving away
> from it. This is not for a console printf statement, but is rather for
> the regmap debugfs name. Using a %pa adds the 0x and leading zeros in
> the debugfs name, when compared to the name before this patch. The
> typecast retains the current format, and replaces the unit-address
> without the leading 0s either. Introducing a local-variable to avoid the
> typecast is overkill.

Thanks for the clarification.

-- 
With Best Regards,
Andy Shevchenko

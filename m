Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EF9A521E678
	for <lists+linux-omap@lfdr.de>; Tue, 14 Jul 2020 05:44:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726435AbgGNDoJ (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 13 Jul 2020 23:44:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39154 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726432AbgGNDoJ (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Mon, 13 Jul 2020 23:44:09 -0400
Received: from mail-io1-xd41.google.com (mail-io1-xd41.google.com [IPv6:2607:f8b0:4864:20::d41])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 71D53C061755;
        Mon, 13 Jul 2020 20:44:09 -0700 (PDT)
Received: by mail-io1-xd41.google.com with SMTP id i4so15825556iov.11;
        Mon, 13 Jul 2020 20:44:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=5pIkH7mXC1jbQvQgKO8e4n9ss2Wr0Vand3f4K2LBYz4=;
        b=YrBOtJnjGtArnUFIOOSjKKuUr3mYU6wCe/3j9WYc1t+7SI0WSSQ3z1qVrokn3PITMz
         Diu+HPEas1OK5EDKEJ8ttv2QbCUqmus7l0+8dXkgj1dTe+MQ3L+MkVo9DUH2lh13HHV6
         XwKvPo4o3gVF0WXt4YdIG6AfeG6a0PSCYzdvCABpRUDm5Mj7S4Ue03eG+K/x9rmhEx3c
         844BZ25AJ2ApY4O/O2iOxuUgzw9EVLl70EBE9r6BZRNKkwg5S+LMEIiidjOCztp1+6hf
         5C1tD6h4nN2FtIAQlV6fNNLHFwNq+emxJcTfMsJV6XLniFpTYOmGSpjqeG6Nlcl4RHfn
         SlMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=5pIkH7mXC1jbQvQgKO8e4n9ss2Wr0Vand3f4K2LBYz4=;
        b=KvKSGMatihbCv3Ivj0K3b+0PD6Tz/w4dDWAe9RryKlMLlkSeqUfCKS89F/n6kLgVSN
         atgXBjQEUT65OgYZPVglU8dpRze+uQlH/YksO7Qcho3BWVsOKSsHqyTwGV8OKy7ZuZJD
         CK+B+YZfmtIN81E1b6mYqIA06UQbLMXzozn8psVvS5OgQZjzUwZgvhFB1nVAxNuG4OmU
         o0prl1H7qan9VK9Z0zn1Kv/I9IjODIaH6glImMhebR1rN8iA52w4fBzAMOPSQn/TuoUM
         ukZQaAbTt1kjmT6OikbdpF5jRQ1vyxaYoYQs+mKLa8vGT66GbyLO84+1+d72yajtuZ2m
         p5/Q==
X-Gm-Message-State: AOAM532VP+22RcWc6WjH2lkBBOSFfByTlnMT0oHAY8lOk4Uto9UFZn81
        BP6OgWIeax9sm6i2m7IaH/dmABCUdwMLsYlWRow=
X-Google-Smtp-Source: ABdhPJwdZwfVYKqVFMbcOMVarwyvJ7kguDcnx//+Z0fzQDSHID9tABdNxDB+esaGr5DViPMpG3uIbsfsyTVjj8YEVXU=
X-Received: by 2002:a6b:ee02:: with SMTP id i2mr3032327ioh.110.1594698248705;
 Mon, 13 Jul 2020 20:44:08 -0700 (PDT)
MIME-Version: 1.0
References: <1594696998-3995-1-git-send-email-dillon.minfei@gmail.com>
 <1594696998-3995-2-git-send-email-dillon.minfei@gmail.com> <20200714133835.3b03b8af@canb.auug.org.au>
In-Reply-To: <20200714133835.3b03b8af@canb.auug.org.au>
From:   dillon min <dillon.minfei@gmail.com>
Date:   Tue, 14 Jul 2020 11:43:31 +0800
Message-ID: <CAL9mu0JurdBoXbSxvHUmNFSBOa=RneNyYtzT=C1MvJs10Y-Geg@mail.gmail.com>
Subject: Re: [PATCH v2] Since am437x have the same clock structure with am335x
 [1][2], reuse the code from Tony Lindgren's patch [3] to fix dcan probe
 failed on am437x platform.
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Benoit Cousson <bcousson@baylibre.com>, tony@atomide.com,
        Rob Herring <robh+dt@kernel.org>, linux-omap@vger.kernel.org,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Tue, Jul 14, 2020 at 11:38 AM Stephen Rothwell <sfr@canb.auug.org.au> wr=
ote:
>
> Hi,
>
> On Tue, 14 Jul 2020 11:23:18 +0800 dillon.minfei@gmail.com wrote:
> >
> > From: dillon min <dillon.minfei@gmail.com>
> >
> > Fixes: 1a5cd7c23cc5 ("bus: ti-sysc: Enable all clocks directly during i=
nit to read revision")
> >
> > [1]: https://www.ti.com/lit/pdf/spruh73 Chapter-23, Figure 23-1. DCAN
> > Integration
> > [2]: https://www.ti.com/lit/pdf/spruhl7 Chapter-25, Figure 25-1. DCAN
> > Integration
> > [3]: commit 516f1117d0fb ("ARM: dts: Configure osc clock for d_can on a=
m335x")
> >
> > Signed-off-by: dillon min <dillon.minfei@gmail.com>
> > ---
> >
> > Hi Stephen,
> >
> > This changes correct commit messages based on your reviewing.
> > make Fixes tags to oneline.
> > make all commit message tags at the end of commit message
>
> But the Fixes: line should be down with the Signed-off-by: line ...
>
Ok, should it be like this=EF=BC=8Ci will resubmit it.

Subject: [PATCH v2] Since am437x have the same clock structure with am335x
 [1][2], reuse the code from Tony Lindgren's patch [3] to fix dcan
 probe failed on the am437x platform.

[1]: https://www.ti.com/lit/pdf/spruh73 Chapter-23, Figure 23-1. DCAN
Integration
[2]: https://www.ti.com/lit/pdf/spruhl7 Chapter-25, Figure 25-1. DCAN
Integration
[3]: commit 516f1117d0fb ("ARM: dts: Configure osc clock for d_can on am335=
x")

Signed-off-by: dillon min <dillon.minfei@gmail.com>
Fixes: 1a5cd7c23cc5 ("bus: ti-sysc: Enable all clocks directly during
init to read revision")

Thanks,
Dillon,
> --
> Cheers,
> Stephen Rothwell

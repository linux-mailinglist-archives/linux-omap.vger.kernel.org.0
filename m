Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A7C7441FBAE
	for <lists+linux-omap@lfdr.de>; Sat,  2 Oct 2021 14:12:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233080AbhJBMOE (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Sat, 2 Oct 2021 08:14:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34696 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233061AbhJBMOD (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Sat, 2 Oct 2021 08:14:03 -0400
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com [IPv6:2a00:1450:4864:20::529])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 68889C061570;
        Sat,  2 Oct 2021 05:12:17 -0700 (PDT)
Received: by mail-ed1-x529.google.com with SMTP id g8so44856498edt.7;
        Sat, 02 Oct 2021 05:12:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=tibZxfhm6fu2F8DsDvkJG8AdOd90GMcQ9Sq4RnXIpao=;
        b=iWQa2iTvX91F8F82So6xGlEkqOnobmYIUO5LO1QMYBy3FCLwD9rwtyGdjok0vzbSMP
         aL1RSEN/i5HuNIFQRWVKveeY+bSomwKCkfZhbLOvv1dc2aXYNQ0F0lciuRf5jcaR69oA
         prYD6/bj6dYl8StO5tXzlyegRVNV6gfdz8h9MC/Bp5PbAWdzHF84oo/8ls8CvrYODI4+
         oxShbmsCy4u4EW2PRA5MI+z0m3tAQDUpQgmCRGlpfA+E2BN7UdCXrFx52r3ffBvpBw+4
         AFVuBZ+5gP69lo7IreZ2g6Rn/7AjptHRKqR6hR7TUnUAk8mcXzdYqvkBjdJC2+r7uY5n
         3Tpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=tibZxfhm6fu2F8DsDvkJG8AdOd90GMcQ9Sq4RnXIpao=;
        b=CxTx1qnti8KpJlr43gE1DddJh4Yv0zFacBsruGfIGiD6Jo66cwxtjVZspsg6+LPIKk
         l/jnqluPfnK5FwbEKsTdQOQUu4WouXHRaEraYc0vv2b1t2v7YVB+kmNzRf1FA/PSJ5wv
         rcEOWuJe07ZZL7QQWHMrrrQyFDCdJKX5XRvhCzXvflB60YVDFS5HAtS8zkdz+igWg8xE
         qoz3R8eQOpvsaoV9Q+NknfqyrkTDA1mvr2p9GSIZs7Cq0/dyu6RrJHeasuk5pzNbujKj
         kNnSY4l09eD1TA3MgvPQ3r/SyThvMRfWRcJSNio/i2NHyzPuimav7EiD+GuMa3c03lKg
         5BlA==
X-Gm-Message-State: AOAM531Do8nerhmlNaQqUxf3c0cpcPOm1v0y2b2hDUslVhH527uMNdik
        dMF9zQynS3XBHwXsWylffFGj5Q/w2wa8urEPERc=
X-Google-Smtp-Source: ABdhPJzRxQBHF8PF9+dkIDaraDxFnDec/EX7TuXiX2MTf3E7412z/FH6I1BLi4GLb0YEgWAmK2F33FQn+BSWtqjtAS8=
X-Received: by 2002:a17:907:785a:: with SMTP id lb26mr3815050ejc.77.1633176735741;
 Sat, 02 Oct 2021 05:12:15 -0700 (PDT)
MIME-Version: 1.0
References: <20210109170103.1249838-1-aford173@gmail.com> <20211001095404.41f73d88@aktux>
 <C0A84970-0AAC-42E7-8E0F-4D165F0C9551@goldelico.com>
In-Reply-To: <C0A84970-0AAC-42E7-8E0F-4D165F0C9551@goldelico.com>
From:   Adam Ford <aford173@gmail.com>
Date:   Sat, 2 Oct 2021 07:12:05 -0500
Message-ID: <CAHCN7x+TdPb0UthQ9CeQL_sWwJmRK++M1kUXZVvCcj8anAFqRQ@mail.gmail.com>
Subject: Re: [PATCH V2] ARM: dts: omap36xx: Remove turbo mode for 1GHz variants
To:     "H. Nikolaus Schaller" <hns@goldelico.com>
Cc:     Andreas Kemnade <andreas@kemnade.info>,
        Linux-OMAP <linux-omap@vger.kernel.org>,
        Adam Ford-BE <aford@beaconembedded.com>,
        =?UTF-8?Q?Beno=C3=AEt_Cousson?= <bcousson@baylibre.com>,
        Tony Lindgren <tony@atomide.com>,
        Rob Herring <robh+dt@kernel.org>,
        devicetree <devicetree@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Fri, Oct 1, 2021 at 4:59 AM H. Nikolaus Schaller <hns@goldelico.com> wrote:
>
>
>
> > Am 01.10.2021 um 09:54 schrieb Andreas Kemnade <andreas@kemnade.info>:
> >
> > On Sat,  9 Jan 2021 11:01:03 -0600
> > Adam Ford <aford173@gmail.com> wrote:
> >
> >> Previously, the 1GHz variants were marked as a turbo,
> >> because that variant has reduced thermal operating range.
> >>
> >> Now that the thermal throttling is in place, it should be
> >> safe to remove the turbo-mode from the 1GHz variants, because
> >> the CPU will automatically slow if the thermal limit is reached.
> >>
> >> Signed-off-by: Adam Ford <aford173@gmail.com>
> >> ---
> >> V2:  The orignal patch had the wrong file added. Add the omap36xx.dtsi
> >>
> > hmm, I somehow expected that there is a revert of this thing going
> > through. But now, the turbo-mode is still missing
>
> tagging by turbo-mode means the OPP is *disabled* by default and
> needs to be enabled actively.
>
> > and I understood the
> > revert is only in Nikolaus' trees.
>
> It is just a revert for the gta04a5 because I think it is the only board
> which is affected (maybe it would need SmartReflex in operation to
> fine tune the OPPs compared to the generic table). Therefore I have
> a patch which adds turbo-mode to the gta04a5.dts
>
> > The 1Ghz mode was working for some
> > time but does not anymore. Is it just me or do others also have the
> > same problems?
>
> That would be interesting to know.
>

What version are you seeing the break?  It's working for me on 5.15.y branch

# cat /sys/devices/system/cpu/cpufreq/policy0/scaling_available_frequencies
300000 600000 800000 1000000
# uname -a
Linux buildroot 5.14.9-00260-g70248e7b378b-dirty #1 SMP Sat Oct 2
06:56:02 CDT 2021 armv7l GNU/Linux
#

adam


> BR,
> NIkolaus
>
> >
> >
> >> diff --git a/arch/arm/boot/dts/omap36xx.dtsi b/arch/arm/boot/dts/omap36xx.dtsi
> >> index 05fe5ed127b0..20844dbc002e 100644
> >> --- a/arch/arm/boot/dts/omap36xx.dtsi
> >> +++ b/arch/arm/boot/dts/omap36xx.dtsi
> >> @@ -72,7 +72,6 @@ opp1g-1000000000 {
> >>                                       <1375000 1375000 1375000>;
> >>                      /* only on am/dm37x with speed-binned bit set */
> >>                      opp-supported-hw = <0xffffffff 2>;
> >> -                    turbo-mode;
> >>              };
> >>      };
> >>
> >
>

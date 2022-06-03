Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D3F6053C72E
	for <lists+linux-omap@lfdr.de>; Fri,  3 Jun 2022 10:54:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234514AbiFCIys (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 3 Jun 2022 04:54:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55632 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229774AbiFCIyr (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Fri, 3 Jun 2022 04:54:47 -0400
Received: from mail-yb1-xb2e.google.com (mail-yb1-xb2e.google.com [IPv6:2607:f8b0:4864:20::b2e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9607F37014;
        Fri,  3 Jun 2022 01:54:46 -0700 (PDT)
Received: by mail-yb1-xb2e.google.com with SMTP id t31so12635741ybi.2;
        Fri, 03 Jun 2022 01:54:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=nqQv5XnLvvB1n80VjfEl8BIVNeboZFbQnFAfs0nNtGk=;
        b=oRd39aaCLk9rmTTbJc93TSHzHCVt8G8pl9JESHBnmqXDpdEfa8t4lxbWWpzU9jjC/a
         EvGgY0O3FAcKZEwm1I+yKWXZwhlF9xFpd67ygtiZg+7SCIQm6cQcQf5/5vf0bN6K8POn
         4OmiOZ2DuAOKfqz2hK6DeE+zuw95tI2cStUslrCy5xfu4lHAuAN7nFVUPnOmCIH3R5Ep
         r3J1rwVyePyJtf6sUph923B0eJXUJwhGAvITndcxJXURNjwUQ34rLOogtSrwlcRmeoT3
         FQsOvIjK0a6Y2WS07jfVTe3058+51U2zDZQYkETZCgGG4pMscXb+fEcSBH6mpYCUuuMG
         EwXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=nqQv5XnLvvB1n80VjfEl8BIVNeboZFbQnFAfs0nNtGk=;
        b=jl45G+5KIlqWsLldCoARxxczoOCpi8Ogg11PE+bfk8rUJKSZ3z9l2nsod0TTn77qp/
         HoaTzgOED/CjigmZeToxFHDzUHmmy5lT1Eck+V0m5yWmWHXI6VmIkAkNc39J/z+WDzPJ
         YNcWKguMzf2VJNAnd3UT/9YdXyLj4PcsVZJ141BLhg12SPgDzARjUTLFx3hyDpqQsdSC
         E7kp/9r43KP60J6nteeUZKzski9ypekq7Wqk7zpZ6xilpkb9KbJRckJA0lS5b42SNZyd
         bi8B8+Sx4EOdUoErDy89A9ED7WwwKyrdZ0hrgy5n/1sOPv5awBl+nco5YoAhbmU2EvkR
         4ZtQ==
X-Gm-Message-State: AOAM530vgY6d1dWQ+ZfdGpZ12RZVmjYkbGcHMOy7FFr26vpg64sWMChZ
        4kLeo33vZ5BLKoC2SvKngDFZwYrynlcEj4HPw5U=
X-Google-Smtp-Source: ABdhPJwGxsoE1yBKbFsL0QNDEZXI1q26fVN67K9HIpH4syYCmIlcvfZ0fGYTscYgZeBUgTnex4oElskBqdQ3v9N3vT4=
X-Received: by 2002:a05:6902:352:b0:64e:8f8:d552 with SMTP id
 e18-20020a056902035200b0064e08f8d552mr9709156ybs.540.1654246485757; Fri, 03
 Jun 2022 01:54:45 -0700 (PDT)
MIME-Version: 1.0
References: <CAK8P3a1YTBRO_pRZLqbNHwG4DaYA56tn1_E0g3c1VW0B-jz-qg@mail.gmail.com>
 <CAGm1_kuaRr3BFWSq-2v4vT0VbVvMX=kMHQsQ1KZnKe9UEff3MA@mail.gmail.com>
 <Yozpa3DlLLEzBR8W@atomide.com> <CAGm1_ku5EusuSJ9zhYZBRGdRUr8_NYsx3=BZQkuYtNJpq3Tn_w@mail.gmail.com>
 <Yo8cLxktTytqAEV3@atomide.com> <CAMj1kXEr848Jaxfk64wDgFHMmq-CLvgXtH_sfqVC-4DRLwCDqA@mail.gmail.com>
 <CAGm1_ksuNbMvg5tVOHswMRWQyX8ZA_U-49Ge6uoG0xV7x5viHA@mail.gmail.com>
 <CAK8P3a04Qc3Qkb2s1OmCFVKi=yrLReL4Np0JJYjskMWozBDr7Q@mail.gmail.com>
 <CAGm1_kvnqOz68UDL=n80kZd1UoUaPGJG10YvkxUnezg1rSf6Lg@mail.gmail.com>
 <CAK8P3a2qat95d14QDp7HfKmqm8Kw0s0WVeLH=GkgBwH2c7nJ8A@mail.gmail.com>
 <YpB0tdMHh/aBlfyk@atomide.com> <CAK8P3a3ocZDD9odfDe_WBeovHXCNU4CSScrmE4HVtLKef_z+EQ@mail.gmail.com>
 <CAGm1_ktOPgUSVjPP44Y49GgFLpDMrECu7eqQu7d2ZvJiOftWAQ@mail.gmail.com>
 <CAK8P3a36s6S2B8PTixxEkmaKXL88NAydTm4abdeC+roGtrUTsw@mail.gmail.com>
 <CAGm1_kvdhqrptEYy8WMfqZqG6gaWoBtAojSW5uXYnyXMVfV=Fw@mail.gmail.com>
 <CAK8P3a22hmSnS4X93ETLpF7vPtK_F1TD51SK5VvhEz9L9H4i3g@mail.gmail.com>
 <CAMj1kXF2NFxiNm=9ixOncN_wkgg2NrNNm9vE-CGUvpJuThj3JA@mail.gmail.com>
 <CAK8P3a1DnyNvBqdRGHAnHcXBfoNPn4GfUmf_SBGRRU3q3iwwvg@mail.gmail.com>
 <CAGm1_kta63UM8um5BB5jOh+r9uFMiGwAiYsrNDOwG3dN-Oo47Q@mail.gmail.com>
 <CAK8P3a2yaKcEiO-LvH5z5azTEX1XTh=9U2MChRS92dtatceY5g@mail.gmail.com>
 <CAGm1_kvXaH19nOmP_Dy3nxWpG0UiX7eyauTLB+9Cd2rBovDcEQ@mail.gmail.com>
 <CAMj1kXFfc-e0+dpLJHj9W+=YS=3i0t1+wxF+4qJ5K-g7pTd+YQ@mail.gmail.com>
 <CAGm1_ksndacPPpyZknvHip=7Fv+3NxXjyfCm_DDMm4EbcBuBig@mail.gmail.com>
 <CAK8P3a2VV26MhWz95OwfKz+2k35ee8V876iqdJdZ4o1HuNba8A@mail.gmail.com>
 <CAGm1_ktyCchFwVWhFtrgR621s_fPZJ3u8UmgOPbg7OCOq0h6ZA@mail.gmail.com>
 <CAK8P3a02uFq4edc_VzPaNQXp_cuLXUMbF4c=k6KATApS9hNHkw@mail.gmail.com>
 <CAMj1kXEvxP8ULqy7ajT_cSxMzYLJuCjEZGfYBb=F9qOwz-AFaQ@mail.gmail.com>
 <CAGm1_ksF1UPpdeiTnADiQK8MFbvP8-eDhc=yaCL75EsE_pG=-g@mail.gmail.com>
 <CAGm1_ksmXTnEo_Mxk7+S4vs_CQAs5ZHoEOpq9Tq3ZFf7sruX7A@mail.gmail.com>
 <CAK8P3a1nhBnbbocBNkKUKYhw14OYE0WPEyQcJJXzbpW4uASu_Q@mail.gmail.com>
 <CAGm1_kswMZkoV9_DnB71ugVTF_rh5SV2NazkHROwXiFqhxTWYA@mail.gmail.com>
 <CAK8P3a0Qdav2JaF8yLydxr9amQp30gnY67CVx+ubowUHeG1VeA@mail.gmail.com>
 <CAMj1kXEL48=w08A2t7522y1visAUcnkkq4LA6ERRP_FbCbEgiw@mail.gmail.com>
 <CAMj1kXFmFfQ1oZ-CUcwe+ojSkk+9KBH1azhGrEJ4=-pZgMXX-Q@mail.gmail.com>
 <CAGm1_ku-tygQJrgvHnvJd0xzb6Vw3t_qdz_VKHJx4YWSxCEryA@mail.gmail.com>
 <CAMj1kXHUoDQ0xZ4yBx9uT6D9=6xfOsJoWLoOKho_-=Z9uYS30w@mail.gmail.com>
 <CAGm1_ks8g3RNwOkC8C_B2eYz56cEA7L-6CRdmqmNwSvAg-JP_g@mail.gmail.com>
 <CAMj1kXH+WR03MX94rd1p7Yz60mfrkOvOx=NYoZ9FCSnqMP4nTw@mail.gmail.com>
 <CAGm1_kvZ_6tPgfrTc3pH+6TedoU+mvuEXb+7aEp5mXfx516fmA@mail.gmail.com>
 <CAMj1kXEfKLYYxt9imEO155oxWTzXtWPpF8txGZ-xCs_6vez-WA@mail.gmail.com> <CAGm1_kvJpoDk=G3xYKT5UD5QnjRGr9Npft-8OCgtB9+qCjRtqQ@mail.gmail.com>
In-Reply-To: <CAGm1_kvJpoDk=G3xYKT5UD5QnjRGr9Npft-8OCgtB9+qCjRtqQ@mail.gmail.com>
From:   Yegor Yefremov <yegorslists@googlemail.com>
Date:   Fri, 3 Jun 2022 10:54:33 +0200
Message-ID: <CAGm1_kvrivJLsFJaZtr6ojryDZFu3Xmpum8FURoFT9vMr54LUA@mail.gmail.com>
Subject: Re: am335x: 5.18.x: system stalling
To:     Ard Biesheuvel <ardb@kernel.org>
Cc:     Arnd Bergmann <arnd@arndb.de>, Tony Lindgren <tony@atomide.com>,
        Linux-OMAP <linux-omap@vger.kernel.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: multipart/mixed; boundary="00000000000027cf3405e087464e"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

--00000000000027cf3405e087464e
Content-Type: text/plain; charset="UTF-8"

On Thu, Jun 2, 2022 at 2:27 PM Yegor Yefremov
<yegorslists@googlemail.com> wrote:
>
> On Thu, Jun 2, 2022 at 12:37 PM Ard Biesheuvel <ardb@kernel.org> wrote:
> >
> > On Thu, 2 Jun 2022 at 12:17, Yegor Yefremov <yegorslists@googlemail.com> wrote:
> > >
> > > On Wed, Jun 1, 2022 at 12:50 PM Ard Biesheuvel <ardb@kernel.org> wrote:
> > > >
> > > > On Wed, 1 Jun 2022 at 12:46, Yegor Yefremov <yegorslists@googlemail.com> wrote:
> > > > >
> > > > > On Wed, Jun 1, 2022 at 12:06 PM Ard Biesheuvel <ardb@kernel.org> wrote:
> > > > > >
> > > > > > On Wed, 1 Jun 2022 at 12:04, Yegor Yefremov <yegorslists@googlemail.com> wrote:
> > > > > > >
> > > > > > > On Wed, Jun 1, 2022 at 11:28 AM Ard Biesheuvel <ardb@kernel.org> wrote:
> > > > > > > >
> > > > > > > > On Wed, 1 Jun 2022 at 10:08, Ard Biesheuvel <ardb@kernel.org> wrote:
> > > > > > > > >
> > > > > > > > > On Wed, 1 Jun 2022 at 09:59, Arnd Bergmann <arnd@arndb.de> wrote:
> > > > > > > > > >
> > > > > > > > > > On Wed, Jun 1, 2022 at 9:36 AM Yegor Yefremov
> > > > > > > > > > <yegorslists@googlemail.com> wrote:
> > > > > > > > > > > On Tue, May 31, 2022 at 5:23 PM Arnd Bergmann <arnd@arndb.de> wrote:
> > > > > > > > > > > > I've pushed a modified branch now, with that fix on the broken commit,
> > > > > > > > > > > > and another change to make CONFIG_IRQSTACKS user-selectable rather
> > > > > > > > > > > > than always enabled. That should tell us if the problem is in the SMP
> > > > > > > > > > > > patching or in the irqstacks.
> > > > > > > > > > > >
> > > > > > > > > > > > Can you test the top of this branch with CONFIG_IRQSTACKS disabled,
> > > > > > > > > > > > and (if that still stalls) retest the fixed commit f0191ea5c2e5 ("[PART 1]
> > > > > > > > > > > > ARM: implement THREAD_INFO_IN_TASK for uniprocessor systems")?
> > > > > > > > > > >
> > > > > > > > > > > 1. the top of this branch with CONFIG_IRQSTACKS disabled stalls
> > > > > > > > > > > 2. f0191ea5c2e5 with the same config - not
> > > > > > > > > >
> > > > > > > > > > Ok, perfect, that does narrow down the problem quite a bit: The final
> > > > > > > > > > patch has seven changes, all of which can be done individually because
> > > > > > > > > > in each case the simplified version in f0191ea5c2e5 is meant to run
> > > > > > > > > > the exact same instructions as the version after the change, when running
> > > > > > > > > > on a uniprocessor machine such as your am335x.
> > > > > > > > > >
> > > > > > > > > > You have already shown earlier that the get_current() and
> > > > > > > > > > __my_cpu_offset() functions are not to blame here, as reverting
> > > > > > > > > > only those does not change the behavior.
> > > > > > > > > >
> > > > > > > > > > This leaves the is_smp() check in set_current(), and the
> > > > > > > > > > four macros in <asm/assembler.h>. I don't see anything obviously
> > > > > > > > > > wrong with any of those five, but I would bet on the macros
> > > > > > > > > > here. Can you try bisecting into this commit, maybe reverting
> > > > > > > > > > the changes to set_current and get_current first, and then
> > > > > > > > > > narrowing it down to (hopefully) a single macro that causes the
> > > > > > > > > > problem?
> > > > > > > > > >
> > > > > > > > >
> > > > > > > > > set_current() is never called by the primary CPU, which is why the
> > > > > > > > > is_smp() check was removed from there in 57a420435edcb0b94 ("ARM: drop
> > > > > > > > > pointless SMP check on secondary startup path").
> > > > > > > > >
> > > > > > > > > So that leaves only the four macros in asm/assembler.h, but I don't
> > > > > > > > > see anything obviously wrong with those either.
> > > > > > > >
> > > > > > > > I pushed a patch on top of Arnd's branch at the link below that gets
> > > > > > > > rid of the subsections, and uses normal branches (and code patching)
> > > > > > > > to switch between the thread ID register and the LDR to retrieve the
> > > > > > > > CPU offset and the current pointer. I have no explanation whether or
> > > > > > > > why it could make a difference, but I think it's worth a try.
> > > > > > >
> > > > > > > The link to your repo is missing.
> > > > > > >
> > > > > >
> > > > > > Oops, sorry :-)
> > > > > >
> > > > > > https://git.kernel.org/pub/scm/linux/kernel/git/ardb/linux.git/log/?h=am335x-stall-test
> > > > >
> > > > > I have tested your branch and it stalls:
> > > > >
> > > >
> > > > OK, thanks for verifying.
> > >
> > > My bisection results for f0191ea5c2e5aab29484ede0493ca385eec5472f as a base:
> > >
> > > percpu.h: sporadic stalls
> > > current.h: always stalls
> > > assembler.h: no stalls
> > > smp.c: no stalls
> > >
> >
> > So you mean that applying the changes to each of those files in
> > isolation to the baseline in f0191ea5c2e5aab29484ede0493ca385eec5472f
> > produces those results, right?
>
> Right.
>
> > That confirms my statement that smp.c cannot be the culprit, and
> > appears to exonerate the pure asm pieces. I wonder if this is related
> > to insufficient asm constraints on the C helpers, or just the cost
> > model taking different decisions because the inline asm string is much
> > longer. In any case, this opens up a couple of avenues we could
> > explore to narrow this down further.
> >
> > As a quick check, can you try the below snippet applied onto the
> > broken current.h build?
> >
> > --- a/arch/arm/include/asm/current.h
> > +++ b/arch/arm/include/asm/current.h
> > @@ -53,7 +53,8 @@ static __always_inline __attribute_const__ struct
> > task_struct *get_current(void)
> >             "   b       . + (2b - 0b)                           \n\t"
> >             "   .popsection                                     \n\t"
> >  #endif
> > -           : "=r"(cur));
> > +           : "=r"(cur)
> > +           : "Q" (*(const unsigned long *)current_stack_pointer));
>
> Where is the current_stack_pointer defined?
>
> >  #elif __LINUX_ARM_ARCH__>= 7 || \
> >        !defined(CONFIG_ARM_HAS_GROUP_RELOCS) || \
> >        (defined(MODULE) && defined(CONFIG_ARM_MODULE_PLTS))
> >
> > Given that the problematic sequence appears to be in C code, could you
> > please confirm whether or not the stall is reproducible when all the
> > pieces that are used by the CAN stack (musb, slcan, ftdio-sio, etc)
> > are built into the kernel rather than built as modules? Also, which
> > GCC version are you using?
>
> For now, the CAN stack parts are built as modules. I'll try to compile them in.
>
> I'm using GCC 10.x

I have tried your patch (see the attachment) and the system stalls.

Will try GCC 11.x and also compiled-in drivers.

--00000000000027cf3405e087464e
Content-Type: application/octet-stream; name="current_v2.patch"
Content-Disposition: attachment; filename="current_v2.patch"
Content-Transfer-Encoding: base64
Content-ID: <f_l3y7ma7g0>
X-Attachment-Id: f_l3y7ma7g0

ZGlmZiAtLWdpdCBhL2FyY2gvYXJtL2luY2x1ZGUvYXNtL2N1cnJlbnQuaCBiL2FyY2gvYXJtL2lu
Y2x1ZGUvYXNtL2N1cnJlbnQuaAppbmRleCA2NzdlMjE3YTllNjUuLmFkMzhkY2MxYzhhMCAxMDA2
NDQKLS0tIGEvYXJjaC9hcm0vaW5jbHVkZS9hc20vY3VycmVudC5oCisrKyBiL2FyY2gvYXJtL2lu
Y2x1ZGUvYXNtL2N1cnJlbnQuaApAQCAtMTQsOSArMTQsNTcgQEAgc3RydWN0IHRhc2tfc3RydWN0
OwogCiBleHRlcm4gc3RydWN0IHRhc2tfc3RydWN0ICpfX2N1cnJlbnQ7CiAKK3JlZ2lzdGVyIHVu
c2lnbmVkIGxvbmcgY3VycmVudF9zdGFja19wb2ludGVyIGFzbSAoInNwIik7CisKIHN0YXRpYyBp
bmxpbmUgX19hdHRyaWJ1dGVfY29uc3RfXyBzdHJ1Y3QgdGFza19zdHJ1Y3QgKmdldF9jdXJyZW50
KHZvaWQpCiB7Ci0JcmV0dXJuIF9fY3VycmVudDsKKwlzdHJ1Y3QgdGFza19zdHJ1Y3QgKmN1cjsK
KworI2lmIF9faGFzX2J1aWx0aW4oX19idWlsdGluX3RocmVhZF9wb2ludGVyKSAmJiBcCisgICAg
ZGVmaW5lZChDT05GSUdfQ1VSUkVOVF9QT0lOVEVSX0lOX1RQSURSVVJPKSAmJiBcCisgICAgIShk
ZWZpbmVkKENPTkZJR19USFVNQjJfS0VSTkVMKSAmJiBcCisgICAgICBkZWZpbmVkKENPTkZJR19D
Q19JU19DTEFORykgJiYgQ09ORklHX0NMQU5HX1ZFUlNJT04gPCAxMzAwMDEpCisJLyoKKwkgKiBV
c2UgdGhlIF9fYnVpbHRpbiBoZWxwZXIgd2hlbiBhdmFpbGFibGUgLSB0aGlzIHJlc3VsdHMgaW4g
YmV0dGVyCisJICogY29kZSwgZXNwZWNpYWxseSB3aGVuIHVzaW5nIEdDQyBpbiBjb21iaW5hdGlv
biB3aXRoIHRoZSBwZXItdGFzaworCSAqIHN0YWNrIHByb3RlY3RvciwgYXMgdGhlIGNvbXBpbGVy
IHdpbGwgcmVjb2duaXplIHRoYXQgaXQgbmVlZHMgdG8KKwkgKiBsb2FkIHRoZSBUTFMgcmVnaXN0
ZXIgb25seSBvbmNlIGluIGV2ZXJ5IGZ1bmN0aW9uLgorCSAqCisJICogQ2xhbmcgPCAxMy4wLjEg
Z2V0cyB0aGlzIHdyb25nIGZvciBUaHVtYjIgYnVpbGRzOgorCSAqIGh0dHBzOi8vZ2l0aHViLmNv
bS9DbGFuZ0J1aWx0TGludXgvbGludXgvaXNzdWVzLzE0ODUKKwkgKi8KKwljdXIgPSBfX2J1aWx0
aW5fdGhyZWFkX3BvaW50ZXIoKTsKKyNlbGlmIGRlZmluZWQoQ09ORklHX0NVUlJFTlRfUE9JTlRF
Ul9JTl9UUElEUlVSTykgfHwgZGVmaW5lZChDT05GSUdfU01QKQorCWFzbSgiMDoJbXJjIHAxNSwg
MCwgJTAsIGMxMywgYzAsIDMJCQlcblx0IgorI2lmZGVmIENPTkZJR19DUFVfVjYKKwkgICAgIjE6
CQkJCQkJCVxuXHQiCisJICAgICIJLnN1YnNlY3Rpb24gMQkJCQkJXG5cdCIKKyNpZiAhKGRlZmlu
ZWQoTU9EVUxFKSAmJiBkZWZpbmVkKENPTkZJR19BUk1fTU9EVUxFX1BMVFMpKSAmJiBcCisgICAg
IShkZWZpbmVkKENPTkZJR19MRF9JU19MTEQpICYmIENPTkZJR19MTERfVkVSU0lPTiA8IDE0MDAw
MCkKKwkgICAgIjI6ICIgTE9BRF9TWU1fQVJNVjYoJTAsIF9fY3VycmVudCkgIgkJXG5cdCIKKwkg
ICAgIgliCTFiCQkJCQlcblx0IgorI2Vsc2UKKwkgICAgIjI6CWxkcgklMCwgM2YJCQkJCVxuXHQi
CisJICAgICIJbGRyCSUwLCBbJTBdCQkJCVxuXHQiCisJICAgICIJYgkxYgkJCQkJXG5cdCIKKwkg
ICAgIjM6CS5sb25nCV9fY3VycmVudAkJCQlcblx0IgorI2VuZGlmCisJICAgICIJLnByZXZpb3Vz
CQkJCQlcblx0IgorCSAgICAiCS5wdXNoc2VjdGlvbiBcIi5hbHQuc21wLmluaXRcIiwgXCJhXCIJ
CVxuXHQiCisJICAgICIJLmxvbmcJMGIgLSAuCQkJCQlcblx0IgorCSAgICAiCWIJLiArICgyYiAt
IDBiKQkJCQlcblx0IgorCSAgICAiCS5wb3BzZWN0aW9uCQkJCQlcblx0IgorI2VuZGlmCisgICAg
ICAgICAgIDogIj1yIihjdXIpCisgICAgICAgICAgIDogIlEiICgqKGNvbnN0IHVuc2lnbmVkIGxv
bmcgKiljdXJyZW50X3N0YWNrX3BvaW50ZXIpKTsKKyNlbGlmIF9fTElOVVhfQVJNX0FSQ0hfXz49
IDcgfHwgXAorICAgICAgKGRlZmluZWQoTU9EVUxFKSAmJiBkZWZpbmVkKENPTkZJR19BUk1fTU9E
VUxFX1BMVFMpKSB8fCBcCisgICAgICAoZGVmaW5lZChDT05GSUdfTERfSVNfTExEKSAmJiBDT05G
SUdfTExEX1ZFUlNJT04gPCAxNDAwMDApCisJY3VyID0gX19jdXJyZW50OworI2Vsc2UKKwlhc20o
TE9BRF9TWU1fQVJNVjYoJTAsIF9fY3VycmVudCkgOiAiPXIiKGN1cikpOworI2VuZGlmCisJcmV0
dXJuIGN1cjsKIH0KIAogI2RlZmluZSBjdXJyZW50IGdldF9jdXJyZW50KCkK
--00000000000027cf3405e087464e--

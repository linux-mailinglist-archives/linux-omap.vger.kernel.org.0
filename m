Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E006FB2446
	for <lists+linux-omap@lfdr.de>; Fri, 13 Sep 2019 18:42:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388618AbfIMQmz (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 13 Sep 2019 12:42:55 -0400
Received: from mail-io1-f68.google.com ([209.85.166.68]:42933 "EHLO
        mail-io1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388471AbfIMQmy (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Fri, 13 Sep 2019 12:42:54 -0400
Received: by mail-io1-f68.google.com with SMTP id n197so63992435iod.9;
        Fri, 13 Sep 2019 09:42:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=zLHIW9KxDiAySOZI+RsQf4+msT020d/rVzQEa09nju4=;
        b=qM5FLBlmEzE9YZjk3JJKPBn7v+HNUjwucvOy8RwYAJcpd6Wx5rhN7LU4r8ACSfsdCQ
         Xa9oI6Se6sGQ+Y1rMX5ZLj/Jq1X885++f2tUt8HlSw3nqNKbKu8DysGX61DTdj9oVHmh
         NN1L48oldt47AF/ybNzh3IClxpZvHePeOqH1QGrek8pafMIKtXpktg1SWQtHx3b/dx3u
         laFii9t9MQDoKTePBaLf/8d4EZg8p1xueprnniIcoACwlw1bLBV5a0mwk9O18ODgRRU6
         5WOrc99nuL3CNsjebOzUhQP1yc6/xTCuJgojhimqFuwcm8mJDtqa2hSqZ1qTsR6c4cZ5
         kFnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=zLHIW9KxDiAySOZI+RsQf4+msT020d/rVzQEa09nju4=;
        b=unpeuPl2tOUlX6j42eMSSjP98TQfHQm0cizHfsVn0NPs5yqRrvx9WNueSK8ualNn3g
         OmUsxOcF36AZ7FjAcWaSsHdN09H5oDP1px5OnjaKsnqhYJ1yA8GmaeR9P8EqQpA7ZGbz
         waIpdgeAJOKW84HfVDdO1s0b5k0xqpJDJJ/k++wxJ5JgRLpiok0ZerRzAyPryNf2Eytq
         1yUEsYcUYhPZ6W/NIZyVwsB+kX8Qbkh/iBw3ZRIDBiri6A5uSewk1Vxn4aefk24ldmWw
         TxF7l3YN6N+buKsPNKOfLec82x/T9P0/hVsOTgczyPXjWYR1wQADYWzwFFakv96jDnoP
         QN0w==
X-Gm-Message-State: APjAAAX7seLOOC97pNvfBRFn/U6RuC1KBNV3ef5qlFWigz9Fiw33LTaf
        l5jWxJdnw8+BZNSBQ6t3OGxx1+MxwFZucXV0/Hg=
X-Google-Smtp-Source: APXvYqxwwWAB0nvqmwcmdBUIOYAyKiYe4AcK5f4dWGMU2v7DEr1hRKWdw6elUT6HIKiFVCngXEWc6qhIRh+ijl/oick=
X-Received: by 2002:a5e:dc47:: with SMTP id s7mr818234iop.228.1568392972173;
 Fri, 13 Sep 2019 09:42:52 -0700 (PDT)
MIME-Version: 1.0
References: <20190912183037.18449-1-aford173@gmail.com> <D4F7E03C-1880-45AC-8F7C-6C8A336E2A01@goldelico.com>
 <CAHCN7xK100mR=fNns3qdDKpOyWsTWXgDnnngQfQ_j8cB_SFfuA@mail.gmail.com>
 <98751DAF-B3F7-4638-97BE-1D067B24EF18@goldelico.com> <CAHCN7xL-CmwmXP3PLdwAHiC-9tMjrpY4k7ZhxQ9WoXY6yUz8BA@mail.gmail.com>
 <ABCE2ACA-D19A-42D2-9606-C60F1A5CBCCB@goldelico.com> <CAHCN7xKfeh-cqJVfbW_km27cgee2MEBdPM3edACRi0fCaohxvw@mail.gmail.com>
 <7C9393BD-B23B-41A6-BF96-E53CD707AAC7@goldelico.com> <CAHCN7x+_f_jrttUGyKHBOUyYjkOx0mJxba1Yb3tPm9ee7+21og@mail.gmail.com>
In-Reply-To: <CAHCN7x+_f_jrttUGyKHBOUyYjkOx0mJxba1Yb3tPm9ee7+21og@mail.gmail.com>
From:   Adam Ford <aford173@gmail.com>
Date:   Fri, 13 Sep 2019 11:42:41 -0500
Message-ID: <CAHCN7xLODa114M77-rX9WHT+uJtsH3yOmbFG2KdEjZpTSECs2w@mail.gmail.com>
Subject: Re: [RFC] ARM: dts: omap36xx: Enable thermal throttling
To:     "H. Nikolaus Schaller" <hns@goldelico.com>
Cc:     Linux-OMAP <linux-omap@vger.kernel.org>,
        Tony Lindgren <tony@atomide.com>,
        =?UTF-8?Q?Andr=C3=A9_Roth?= <neolynx@gmail.com>,
        Discussions about the Letux Kernel 
        <letux-kernel@openphoenux.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Andreas Kemnade <andreas@kemnade.info>,
        Nishanth Menon <nm@ti.com>, Adam Ford <adam.ford@logicpd.com>,
        kernel@pyra-handheld.com
Content-Type: text/plain; charset="UTF-8"
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Fri, Sep 13, 2019 at 11:35 AM Adam Ford <aford173@gmail.com> wrote:
>
> On Fri, Sep 13, 2019 at 10:09 AM H. Nikolaus Schaller <hns@goldelico.com> wrote:
> >
> >
> > > Am 13.09.2019 um 17:01 schrieb Adam Ford <aford173@gmail.com>:
> > >
> > > On Fri, Sep 13, 2019 at 9:24 AM H. Nikolaus Schaller <hns@goldelico.com> wrote:
> > >>
> > >>
> > >>> Am 13.09.2019 um 16:05 schrieb Adam Ford <aford173@gmail.com>:
> > >>>
> > >>> On Fri, Sep 13, 2019 at 8:32 AM H. Nikolaus Schaller <hns@goldelico.com> wrote:
> > >>>>
> > >>>> Hi Adam,
> > >>>>
> > >>>>> Am 13.09.2019 um 13:07 schrieb Adam Ford <aford173@gmail.com>:
> > >>>>
> > >>>>>>> +     cpu_cooling_maps: cooling-maps {
> > >>>>>>> +             map0 {
> > >>>>>>> +                     trip = <&cpu_alert0>;
> > >>>>>>> +                     /* Only allow OPP50 and OPP100 */
> > >>>>>>> +                     cooling-device = <&cpu 0 1>;
> > >>>>>>
> > >>>>>> omap4-cpu-thermal.dtsi uses THERMAL_NO_LIMIT constants but I do not
> > >>>>>> understand their meaning (and how it relates to the opp list).
> > >>>>>
> > >>>>> I read through the documentation, but it wasn't completely clear to
> > >>>>> me. AFAICT, the numbers after &cpu represent the min and max index in
> > >>>>> the OPP table when the condition is hit.
> > >>>>
> > >>>> Ok. It seems to use "cooling state" for those and the first is minimum
> > >>>> and the last is maximum. Using THERMAL_NO_LIMIT (-1UL) means to have
> > >>>> no limits.
> > >>>>
> > >>>> Since here we use the &cpu node it is likely that the "cooling state"
> > >>>> is the same as the OPP index currently in use.
> > >>>>
> > >>>> I have looked through the .dts which use cpu_crit and the picture is
> > >>>> not unique...
> > >>>>
> > >>>> omap4           seems to only define it
> > >>>> am57xx          has two different grade dtsi files
> > >>>> dra7            overwrites critical temperature value
> > >>>> am57xx-beagle   defines a gpio to control a fan
> > >>>
> > >
> > > I am going to push a separate but related RFC with 2 patches in the
> > > series.  This new one will setup the alerts and maps without any
> > > throttling for all omap3's in the first patch.  The second patch will
> > > consolidate the thermal references to omap3.dtsi so omap34, omap36 and
> > > am35 can all use them without having to duplicate the entries.
> > >
> > > It will make the omap36xx changes simpler to manage, because we can
> > > just modify a portion of the entries instead of having the whole
> > > table.
> > >
> > > Once this parallel RFC gets comments/feedback, I'll re-integrate the
> > > omap36xx throttling.
> >
> > Good idea. I have looked over them and they seem to be ok.
>
> Rebasing my omap36xx throttling after the v2 RFC I pushed moving the
> omap3-cpu thermal stuff, I modified the omap36xx accordingly to try
> and force the alert condition:
>
> &cpu_alert0 {
>      temperature = <55000>; /* millicelsius */
> };
>
> &cpu_cooling_maps {
>      map0 {
>           /* OPP130 and OPP1G are not available above 90C */
>           cooling-device = <&cpu 0 2>;
>      };
> };
>
> I would expect that with the temperature set for 55C, it would have
> done something, but it doesn't appear to be working as I would expect.
>
> # cat /sys/devices/virtual/thermal/thermal_zone0/temp
> 58500
>
> # cat /sys/devices/system/cpu/cpufreq/policy0/scaling_available_frequencies
> 300000 600000 800000
> #
>
> :-(
>

Good news (I think)

With cooling-device = <&cpu 1 2> setup, I was able to ask the max
frequency and it returned 600MHz.

# cat /sys/devices/virtual/thermal/thermal_zone0/temp
58500
# cat /sys/devices/system/cpu/cpufreq/policy0/scaling_available_frequencies
300000 600000 800000
# cat /sys/devices/system/cpu/cpufreq/policy0/scaling_m
scaling_max_freq  scaling_min_freq
# cat /sys/devices/system/cpu/cpufreq/policy0/scaling_max_freq
600000

adam
>
> >
> > >
> > > adam
> >
> > BR and thanks,
> > Nikolaus
> >

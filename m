Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 44C73B242A
	for <lists+linux-omap@lfdr.de>; Fri, 13 Sep 2019 18:36:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389940AbfIMQf2 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 13 Sep 2019 12:35:28 -0400
Received: from mail-io1-f67.google.com ([209.85.166.67]:36784 "EHLO
        mail-io1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387822AbfIMQf2 (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Fri, 13 Sep 2019 12:35:28 -0400
Received: by mail-io1-f67.google.com with SMTP id b136so63959363iof.3;
        Fri, 13 Sep 2019 09:35:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=KjwJiwmcH2/79ybI6jcq3ploVvAGPGEEuHdJsNide34=;
        b=Tf9r7it5Nm7p62KuSGGb2k8JtyI/gS7gqlZcv+2cBaRdH/9pRVAIuSBQrX4XqlfCV3
         Bp1wmypp2i1tkjtr3pUaVrd/MzIS+whjmHWKnbPHlt3qZ+M7ThRXAmgL7R7a/oSFs3S6
         AbgFSXAVujz552kbjEVI+7DS2dCCI8ytdols0iBbY0rJyMTtlnF9+nMuTV7OJXQo7rpz
         xkm0TRUwWVghrcrpVajExH89/J4whoqJLSUGZe/IGV3GVtmNxZ6VYSFrpeHEmvWF089g
         bFU050zLq86T/khbSfqIAltZY6/Z3MSoNVa7qeRi4tOL9C+C4y5P+fdtSkZPSYQKGOtC
         fGng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=KjwJiwmcH2/79ybI6jcq3ploVvAGPGEEuHdJsNide34=;
        b=Ntyg0NAkLDxWmIliSMimrJyZWwSoq12rlwMph+h8SPcoeiXmIcxmSLHUWXuGVRWGFe
         GawKwI0FUyOiAWiBNa0gDxqU1GYzQvVmwZW4gNH16S0GSGkGtQWpZ3k8vP4wVGUN1fgo
         PBjCISpRDqNoZv0fwQp1ZJIaqVZMCzqummOraLhqKMHfZAc2cIcehT95rEjIsXDVn85M
         0HZrkzZSLTOxoZWYN9qckkd1YEYftrpzgPo4ZYC6LmsTeOH+Prrs16QLfqf3+ruCd6/Z
         qmLi675ZazCgc6kbG9EH9NYWUpNtkZ/0qPuq4DwjXvBHScTKAIUiWZDTwfmQudArDwmR
         lGxg==
X-Gm-Message-State: APjAAAUq3RFMRD+EOHWEb63Ir8jShEZhdaImRQ0D5yHkhPUTmJCkB0lb
        hFY7RmJAwmIpV89NJuttE7JrvTAGj7lQUuDeb8M=
X-Google-Smtp-Source: APXvYqzKeHmSJRvJtlL+yF2VNMXHs6xIV1eggn3tngTE5IZYb9CUEvFC5LomeFzRpoLiqJM8NNneb8dprT+qGrS1nic=
X-Received: by 2002:a6b:b213:: with SMTP id b19mr714079iof.58.1568392527255;
 Fri, 13 Sep 2019 09:35:27 -0700 (PDT)
MIME-Version: 1.0
References: <20190912183037.18449-1-aford173@gmail.com> <D4F7E03C-1880-45AC-8F7C-6C8A336E2A01@goldelico.com>
 <CAHCN7xK100mR=fNns3qdDKpOyWsTWXgDnnngQfQ_j8cB_SFfuA@mail.gmail.com>
 <98751DAF-B3F7-4638-97BE-1D067B24EF18@goldelico.com> <CAHCN7xL-CmwmXP3PLdwAHiC-9tMjrpY4k7ZhxQ9WoXY6yUz8BA@mail.gmail.com>
 <ABCE2ACA-D19A-42D2-9606-C60F1A5CBCCB@goldelico.com> <CAHCN7xKfeh-cqJVfbW_km27cgee2MEBdPM3edACRi0fCaohxvw@mail.gmail.com>
 <7C9393BD-B23B-41A6-BF96-E53CD707AAC7@goldelico.com>
In-Reply-To: <7C9393BD-B23B-41A6-BF96-E53CD707AAC7@goldelico.com>
From:   Adam Ford <aford173@gmail.com>
Date:   Fri, 13 Sep 2019 11:35:16 -0500
Message-ID: <CAHCN7x+_f_jrttUGyKHBOUyYjkOx0mJxba1Yb3tPm9ee7+21og@mail.gmail.com>
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

On Fri, Sep 13, 2019 at 10:09 AM H. Nikolaus Schaller <hns@goldelico.com> wrote:
>
>
> > Am 13.09.2019 um 17:01 schrieb Adam Ford <aford173@gmail.com>:
> >
> > On Fri, Sep 13, 2019 at 9:24 AM H. Nikolaus Schaller <hns@goldelico.com> wrote:
> >>
> >>
> >>> Am 13.09.2019 um 16:05 schrieb Adam Ford <aford173@gmail.com>:
> >>>
> >>> On Fri, Sep 13, 2019 at 8:32 AM H. Nikolaus Schaller <hns@goldelico.com> wrote:
> >>>>
> >>>> Hi Adam,
> >>>>
> >>>>> Am 13.09.2019 um 13:07 schrieb Adam Ford <aford173@gmail.com>:
> >>>>
> >>>>>>> +     cpu_cooling_maps: cooling-maps {
> >>>>>>> +             map0 {
> >>>>>>> +                     trip = <&cpu_alert0>;
> >>>>>>> +                     /* Only allow OPP50 and OPP100 */
> >>>>>>> +                     cooling-device = <&cpu 0 1>;
> >>>>>>
> >>>>>> omap4-cpu-thermal.dtsi uses THERMAL_NO_LIMIT constants but I do not
> >>>>>> understand their meaning (and how it relates to the opp list).
> >>>>>
> >>>>> I read through the documentation, but it wasn't completely clear to
> >>>>> me. AFAICT, the numbers after &cpu represent the min and max index in
> >>>>> the OPP table when the condition is hit.
> >>>>
> >>>> Ok. It seems to use "cooling state" for those and the first is minimum
> >>>> and the last is maximum. Using THERMAL_NO_LIMIT (-1UL) means to have
> >>>> no limits.
> >>>>
> >>>> Since here we use the &cpu node it is likely that the "cooling state"
> >>>> is the same as the OPP index currently in use.
> >>>>
> >>>> I have looked through the .dts which use cpu_crit and the picture is
> >>>> not unique...
> >>>>
> >>>> omap4           seems to only define it
> >>>> am57xx          has two different grade dtsi files
> >>>> dra7            overwrites critical temperature value
> >>>> am57xx-beagle   defines a gpio to control a fan
> >>>
> >
> > I am going to push a separate but related RFC with 2 patches in the
> > series.  This new one will setup the alerts and maps without any
> > throttling for all omap3's in the first patch.  The second patch will
> > consolidate the thermal references to omap3.dtsi so omap34, omap36 and
> > am35 can all use them without having to duplicate the entries.
> >
> > It will make the omap36xx changes simpler to manage, because we can
> > just modify a portion of the entries instead of having the whole
> > table.
> >
> > Once this parallel RFC gets comments/feedback, I'll re-integrate the
> > omap36xx throttling.
>
> Good idea. I have looked over them and they seem to be ok.

Rebasing my omap36xx throttling after the v2 RFC I pushed moving the
omap3-cpu thermal stuff, I modified the omap36xx accordingly to try
and force the alert condition:

&cpu_alert0 {
     temperature = <55000>; /* millicelsius */
};

&cpu_cooling_maps {
     map0 {
          /* OPP130 and OPP1G are not available above 90C */
          cooling-device = <&cpu 0 2>;
     };
};

I would expect that with the temperature set for 55C, it would have
done something, but it doesn't appear to be working as I would expect.

# cat /sys/devices/virtual/thermal/thermal_zone0/temp
58500

# cat /sys/devices/system/cpu/cpufreq/policy0/scaling_available_frequencies
300000 600000 800000
#

:-(


>
> >
> > adam
>
> BR and thanks,
> Nikolaus
>

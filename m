Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DA24BAF39F
	for <lists+linux-omap@lfdr.de>; Wed, 11 Sep 2019 02:24:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726208AbfIKAYd (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 10 Sep 2019 20:24:33 -0400
Received: from mail-io1-f66.google.com ([209.85.166.66]:34481 "EHLO
        mail-io1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726126AbfIKAYd (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 10 Sep 2019 20:24:33 -0400
Received: by mail-io1-f66.google.com with SMTP id k13so26622513ioj.1;
        Tue, 10 Sep 2019 17:24:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=hG6Ad8oG+XWKQFZ06WDpVgaXMLOxylPSZI2j3avJCp8=;
        b=a9WY6tPJhLtXpuSJHyBLw9J5ha92tm+Z8pe+ly1rtWlFMe1EtGpJbuzdZXFfsCDHps
         4g+hCYsJpQF+ZotqJIV1/wcZqQVL0FlsUtfoZmM/k6tp3CmTrLPXmxxufvZ5mW0P9EFI
         h9bZhmIVHqRpaASjxvvN4Ip64ATS01T4QA77BrnWftbbYKYXqhFTHKbhar1ozk72dSBB
         3kn0DZ1d8+W3GZxtpxxuur3trBDAHH+KJPVz9EIBjzNWyxpnUxq0a+oNLeE/m6ztJ+3N
         ib73nQKEmWoJFzekQKmMIoHtvag7NoOQHm8kmsBV8CWCfo1CP5iMRvHb9DXgAKq30Qlg
         jvcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=hG6Ad8oG+XWKQFZ06WDpVgaXMLOxylPSZI2j3avJCp8=;
        b=dWTkblaLacGPhZYi6AsqUHCTng7tL1DCMAFo48u2EC2YC8WUpE8vn/3yqIOvIwAGRq
         P4KaEjDZ0bOhur8WGGPl1jF4AHdh5giNSA3nrkUj2xT/fP4F8iLwtOdEbzl+xB4HfYSL
         VFDvHlxKSFQQ8GMkVROik1YdzjV25Ub3e6upD0ZocjPtT+AQPlWrZqGrxtdofHORxXR+
         aMZViLpL0BjBFyf+vEHEB6+NnCIv65GvwmSlXWtF/dqbsbKo5eOan9o2/E9w52QJGnaV
         yAxVOugnzWjWSMfFBy5m93KowAqz7crej8ozgOJIkcqJNiFbcxqEd1BATBKJmE3K1lXb
         Of9w==
X-Gm-Message-State: APjAAAVKMnJSv2b5lDGiTrnSX/bjbYOQG8YjHnDO4AkoQ4ZHkASl46q8
        nLj8t/9kZRCYVETBn/tQtpfanhyZnEmqCH/8zZA=
X-Google-Smtp-Source: APXvYqxWR7wwaGhiLBd+q6fW6t3WjkY/HH3Y6Wso+cn3pkti5dpmORYih3cb+7MWYLXE3/sXM565U+g8djh/oLDbXDg=
X-Received: by 2002:a5d:8518:: with SMTP id q24mr28044931ion.228.1568161471394;
 Tue, 10 Sep 2019 17:24:31 -0700 (PDT)
MIME-Version: 1.0
References: <C04F49BA-1229-4E96-9FCF-4FC662D1DB11@goldelico.com>
 <CAHCN7x+Ye6sB_YqO0sAX1OJDw64B-qGS3pL545v3Xk5z914cwQ@mail.gmail.com>
 <0C1EF64E-B33C-4BFA-A7D3-471DD1B9EE86@goldelico.com> <515048DE-138D-4400-8168-F2B7D61F1005@goldelico.com>
 <CAHCN7xLPCX9rZ0+7KVBiA_bgZ6tg6VeCXqD-UXu+6iwpFMPVrA@mail.gmail.com>
 <7B3D1D77-3E8C-444F-90B9-6DF2641178B8@goldelico.com> <CAHCN7xLW58ggx3CpVL=HdCVHWo6D-MCTB91A_9rtSRoZQ+xJuQ@mail.gmail.com>
 <FA2920FE-B76A-4D44-A264-862A1CCBF7FC@goldelico.com> <CAHCN7xJsPa0i+Z+qpCkWcdAh9+udmGT0RPNchdDsfB=8ptd3Nw@mail.gmail.com>
 <87420DBD-770F-4C32-9499-A3AEA5876E8A@goldelico.com> <20190909163236.GP52127@atomide.com>
 <E001F74D-724E-4C50-9265-CBD33C4F2918@goldelico.com> <F8F08882-8011-441C-9581-ECCE9772EC21@goldelico.com>
 <CAHCN7x+fgtMHMNYU2W7BRQwd-d2g_Tb8-L5QNcnZjCF=VzRXJg@mail.gmail.com>
 <3663B13C-1AAB-4BE3-8CAD-F821B70393FA@goldelico.com> <CAHCN7x+mLCNq4evwGZfk6Ka=3o6EzhL=s38aNdukyLwKB1xO7A@mail.gmail.com>
 <56482888-DBD3-4658-8DB9-FB57653B5AA8@goldelico.com> <2DC3BCD1-BD61-4109-9AF3-04FBD980FFB8@goldelico.com>
 <CAHCN7x++uBzYx0cK4K6CY6aveofti5TVXnqEeNKnGBy_fzm5GQ@mail.gmail.com>
In-Reply-To: <CAHCN7x++uBzYx0cK4K6CY6aveofti5TVXnqEeNKnGBy_fzm5GQ@mail.gmail.com>
From:   Adam Ford <aford173@gmail.com>
Date:   Tue, 10 Sep 2019 19:24:18 -0500
Message-ID: <CAHCN7xLPZisrNk==eF-+V8hD+sceQq25qw+sK7vVZAYdd8=Q2Q@mail.gmail.com>
Subject: Re: [Letux-kernel] [RFC PATCH 0/3] Enable 1GHz support on omap36xx
To:     "H. Nikolaus Schaller" <hns@goldelico.com>
Cc:     Tony Lindgren <tony@atomide.com>,
        =?UTF-8?Q?Andr=C3=A9_Roth?= <neolynx@gmail.com>,
        Linux-OMAP <linux-omap@vger.kernel.org>,
        Discussions about the Letux Kernel 
        <letux-kernel@openphoenux.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Andreas Kemnade <andreas@kemnade.info>,
        Nishanth Menon <nm@ti.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Tue, Sep 10, 2019 at 3:06 PM Adam Ford <aford173@gmail.com> wrote:
>
> On Tue, Sep 10, 2019 at 2:55 PM H. Nikolaus Schaller <hns@goldelico.com> wrote:
> >
> > Ok,
> >
> > > Am 10.09.2019 um 20:51 schrieb H. Nikolaus Schaller <hns@goldelico.com>:
> > >
> > >>>> it, but then I got some nasty errors and crashes.
> > >>>
> > >>> I have done the same but not (yet) seen a crash or error. Maybe you had
> > >>> a typo?
> > >>
> > >> Can you send me an updated patch?  I'd like to try to get where you
> > >> are that doesn't crash.
> > >
> > > Yes, as soon as I have access.
> >
> > it turns out that my patch breaks cpufreq completely...
> > So it looks as if *I* have a typo :)
> >
> > Hence I am likely running at constant speed and the
> > VDD1 regulator is fixed a 1.200V.
> >
> > root@letux:~# dmesg|fgrep opp
> > [    2.426208] cpu cpu0: opp_parse_supplies: Invalid number of elements in opp-microvolt property (6) with supplies (1)
> > [    2.438140] cpu cpu0: _of_add_opp_table_v2: Failed to add OPP, -22
> > root@letux:~# cat /sys/class/regulator/regulator.8/microvolts
> > 1200000
> > root@letux:~#
> >
> > The error message looks as if we have to enable multi_regulator.
>
> That will enable both vdd and vbb regulators from what I can tell in the driver.
>
> > And that may need to rename cpu0-supply to vdd-supply (unless the
> > names can be configured).
>
> That is consistent with what I found.  vdd-supply = <&vcc>; and
> vbb-supply = <&abb_mpu_iva>;
> I put them both under the cpu node.  Unfortunately, when I did that,
> my board crashed.
>
> I am thinking it has something to do with the abb_mpu_iva driver
> because until this point, we've always operated at 800MHz or lower
> which all have the same behavior in abb_mpu_iva.
>
> With the patch you posted for the regulator, without the update to
> cpufreq,  and with debugging enabled, I received the following in
> dmesg:
>
> [    1.112518] ti_abb 483072f0.regulator-abb-mpu: Missing
> 'efuse-address' IO resource
> [    1.112579] ti_abb 483072f0.regulator-abb-mpu: [0]v=1012500 ABB=0
> ef=0x0 rbb=0x0 fbb=0x0 vset=0x0
> [    1.112609] ti_abb 483072f0.regulator-abb-mpu: [1]v=1200000 ABB=0
> ef=0x0 rbb=0x0 fbb=0x0 vset=0x0
> [    1.112609] ti_abb 483072f0.regulator-abb-mpu: [2]v=1325000 ABB=0
> ef=0x0 rbb=0x0 fbb=0x0 vset=0x0
> [    1.112640] ti_abb 483072f0.regulator-abb-mpu: [3]v=1375000 ABB=1
> ef=0x0 rbb=0x0 fbb=0x0 vset=0x0
> [    1.112731] ti_abb 483072f0.regulator-abb-mpu: ti_abb_init_timings:
> Clk_rate=13000000, sr2_cnt=0x00000032
>

Using an unmodified kernel, I changed the device tree to make the abb
regulator power the cpu instead of vcc.  After doing so, I was able to
read the microvolt value, and it matched the processor's desired OPP
voltage, and the debug code showed the abb regulator was attempting to
set the various index based on the needed voltage.  I think the abb
driver is working correctly.

I think tomorrow, I will re-apply the patches and tweak it again to
support both vdd and vbb regulators.  If it crashes again, I'll look
more closely at the logs to see if I can determine why.  I think it's
pretty close.  I also need to go back and find the SmartReflex stuff
as well.

adam
>
> adam
> >
> > BR,
> > Nikolaus
> >

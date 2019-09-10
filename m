Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3F172AF226
	for <lists+linux-omap@lfdr.de>; Tue, 10 Sep 2019 22:06:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725875AbfIJUGQ (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 10 Sep 2019 16:06:16 -0400
Received: from mail-io1-f68.google.com ([209.85.166.68]:43439 "EHLO
        mail-io1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725797AbfIJUGQ (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 10 Sep 2019 16:06:16 -0400
Received: by mail-io1-f68.google.com with SMTP id r8so15536273iol.10;
        Tue, 10 Sep 2019 13:06:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=YG7RvdOIwjK1UdixQ7WKAg7NBDBytJur+Essvs27pB4=;
        b=cBVuy1j8LvwjXNlKea3WZZu/llHIKajhDRDcOIpf6pBd4Nz9JFm0c1z7/GE+YKxc25
         2AsBPGH7QZOxsEaO7+8aV7QFbH0fLtyvUzhzfLIXaDHveXCeSqRAtb9coMkaRH3UGR9Y
         DTQRfwqpDZv9IIxaHbie/fcNyXdyV8zbz8VRH0D1rW2PrkDclKwaBToEOIgFqPAkkH5y
         ATWiYgl770OR2U+iD3FObOd5vRUZdzKK/fGWiz5CfI6Pt/4N/KJnldfW2JykI5fHBITk
         gf+qOK9vt8xvGoK+q4gQSx0rI7qKEX5O/h2xoAT6XE8uJrTpMvwX2i+0Gxh03rPwGMxS
         7t1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=YG7RvdOIwjK1UdixQ7WKAg7NBDBytJur+Essvs27pB4=;
        b=P7UAWG5uAYFz/imO94B3IdTn6WoYNgzxD5mCUCQgt7cY2LFDUugJSnXAA8H4QZpOfT
         1QkOPMrjCTfzEOTo0o/lpq6WbfYhVhYtnFIpzWjPnQ0bGm0aIPj/8YZ7lHcRLuv5oPU9
         bukR6NBT7P97aPHaLr/yGarVGS4cqGtqwWwkO6JLDxb4JTquT9Bm4qQAUlOdm46thK+5
         zekNvc97ic8FKNsbEKGYvLpygG3heIbVthR2R3jz+g9C5WdAYZsnz4iNIXAEAlFbJ2Sb
         q1c5dT8N1EllF+3WQGHFtqm7Tt5eMtV49T9jtNuMqbdiF3K7xUCCTuHh+YbpjR+QqHno
         181w==
X-Gm-Message-State: APjAAAUg5WUvZ9WixeG6ohiFiZ/MgbbbDLEO/vHcLRtLHfrgwNt2Br+6
        qIWiQEXTYqT2jO7hBQ+0wlcce03OtPpAM10pHTU=
X-Google-Smtp-Source: APXvYqy5ZqCktt/W+m/8o1GlDoAoLwLRdRlkAlbu90c1Mkoxh1EwMPZWMP6kmDmzOnFjz5/3psJNCLYZtkbEx1gfSCg=
X-Received: by 2002:a6b:cd81:: with SMTP id d123mr4299123iog.78.1568145974838;
 Tue, 10 Sep 2019 13:06:14 -0700 (PDT)
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
In-Reply-To: <2DC3BCD1-BD61-4109-9AF3-04FBD980FFB8@goldelico.com>
From:   Adam Ford <aford173@gmail.com>
Date:   Tue, 10 Sep 2019 15:06:03 -0500
Message-ID: <CAHCN7x++uBzYx0cK4K6CY6aveofti5TVXnqEeNKnGBy_fzm5GQ@mail.gmail.com>
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

On Tue, Sep 10, 2019 at 2:55 PM H. Nikolaus Schaller <hns@goldelico.com> wrote:
>
> Ok,
>
> > Am 10.09.2019 um 20:51 schrieb H. Nikolaus Schaller <hns@goldelico.com>:
> >
> >>>> it, but then I got some nasty errors and crashes.
> >>>
> >>> I have done the same but not (yet) seen a crash or error. Maybe you had
> >>> a typo?
> >>
> >> Can you send me an updated patch?  I'd like to try to get where you
> >> are that doesn't crash.
> >
> > Yes, as soon as I have access.
>
> it turns out that my patch breaks cpufreq completely...
> So it looks as if *I* have a typo :)
>
> Hence I am likely running at constant speed and the
> VDD1 regulator is fixed a 1.200V.
>
> root@letux:~# dmesg|fgrep opp
> [    2.426208] cpu cpu0: opp_parse_supplies: Invalid number of elements in opp-microvolt property (6) with supplies (1)
> [    2.438140] cpu cpu0: _of_add_opp_table_v2: Failed to add OPP, -22
> root@letux:~# cat /sys/class/regulator/regulator.8/microvolts
> 1200000
> root@letux:~#
>
> The error message looks as if we have to enable multi_regulator.

That will enable both vdd and vbb regulators from what I can tell in the driver.

> And that may need to rename cpu0-supply to vdd-supply (unless the
> names can be configured).

That is consistent with what I found.  vdd-supply = <&vcc>; and
vbb-supply = <&abb_mpu_iva>;
I put them both under the cpu node.  Unfortunately, when I did that,
my board crashed.

I am thinking it has something to do with the abb_mpu_iva driver
because until this point, we've always operated at 800MHz or lower
which all have the same behavior in abb_mpu_iva.

With the patch you posted for the regulator, without the update to
cpufreq,  and with debugging enabled, I received the following in
dmesg:

[    1.112518] ti_abb 483072f0.regulator-abb-mpu: Missing
'efuse-address' IO resource
[    1.112579] ti_abb 483072f0.regulator-abb-mpu: [0]v=1012500 ABB=0
ef=0x0 rbb=0x0 fbb=0x0 vset=0x0
[    1.112609] ti_abb 483072f0.regulator-abb-mpu: [1]v=1200000 ABB=0
ef=0x0 rbb=0x0 fbb=0x0 vset=0x0
[    1.112609] ti_abb 483072f0.regulator-abb-mpu: [2]v=1325000 ABB=0
ef=0x0 rbb=0x0 fbb=0x0 vset=0x0
[    1.112640] ti_abb 483072f0.regulator-abb-mpu: [3]v=1375000 ABB=1
ef=0x0 rbb=0x0 fbb=0x0 vset=0x0
[    1.112731] ti_abb 483072f0.regulator-abb-mpu: ti_abb_init_timings:
Clk_rate=13000000, sr2_cnt=0x00000032


adam
>
> BR,
> Nikolaus
>

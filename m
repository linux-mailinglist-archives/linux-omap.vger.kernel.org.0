Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 94C1EB031E
	for <lists+linux-omap@lfdr.de>; Wed, 11 Sep 2019 19:50:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729688AbfIKRuH (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 11 Sep 2019 13:50:07 -0400
Received: from mail-io1-f66.google.com ([209.85.166.66]:38273 "EHLO
        mail-io1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729681AbfIKRuG (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Wed, 11 Sep 2019 13:50:06 -0400
Received: by mail-io1-f66.google.com with SMTP id k5so22572356iol.5;
        Wed, 11 Sep 2019 10:50:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=BiVtPEqM908NUB3dBSJY2gAQDyOXwRsQwEkRcPZywqI=;
        b=jc9Nf8+GW9nZpQ0ok6swsNOLkv+pGqsSyc21nizbrfEMW5OQZTAYm96rg9TIObiBCt
         XHJngLQdhpxII/jMetLaSjWWHddk+kc/6WlV6Rp5+ONZJ7lo9qA/4x3vO97qduAHC/Th
         ItwIUifaX2DGdTlFMc54yWpK8kM0fvXp6akMNLJpOBl47p2BXp/oE/sf9T72YQqwLto9
         9dUIzTM4+awJdTHsMN7TjQ8pJhcccTbf9h1Ms1Qc17ZJeuUt/80RKtfHmmwkQyBWZpkz
         q2dsHwVpM24jqLYSfhJv9bSmw1LY+mIBL5JMRx2hQmIBIUNThCkmEvpxKsr0VzRUdMM8
         BHMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=BiVtPEqM908NUB3dBSJY2gAQDyOXwRsQwEkRcPZywqI=;
        b=lGKzQwP95M0H3IPHjOp/FJ5hUVMIw+REtqM54dnMtNu17NtV3cvaPhxcNPTBooGWBI
         nIYouiZAW+61ngGKwhHWt66QVVyXgD0ZHGO0MZkEwW1Z5woCWv886Cr3YZHKd9oMwGS9
         +dC4TPvCwldDoQ/EQy9wAvLuXNqBCCfc32y3T4Z/DJrn2BQsZi/YqomnzrEczMHu4oVK
         VCRW1G1JZti8p5ChCcvMNvCMKeY2mYzSBQcuwJs59U2j6GROLWloNl8yUazAVQmbmTH7
         KpOe0N2izE9qu9wRX+QdveQ8kHQEW/qpQkh7IvMZVuoCLT7hTcwfn7Iay6HmxcCQSG22
         heZA==
X-Gm-Message-State: APjAAAU5v3fnTs86+OaSUhlrZbHlZAxwdVB93OYsmjP9HthWn38reRI1
        lM7tftpVEz+I9DD7OXwjf+G0NHQ/goZlSaGhjQg=
X-Google-Smtp-Source: APXvYqxIT4Dcqge2c5gC0lT0eUdANFfKovs5IBIuAHz7cTm/bLxKVUyS8v9G9EAwjfRfiW5heNFtoExzCoI5CJy/qRU=
X-Received: by 2002:a6b:8e92:: with SMTP id q140mr13229896iod.205.1568224205056;
 Wed, 11 Sep 2019 10:50:05 -0700 (PDT)
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
 <56482888-DBD3-4658-8DB9-FB57653B5AA8@goldelico.com> <CAHCN7xLPZisrNk==eF-+V8hD+sceQq25qw+sK7vVZAYdd8=Q2Q@mail.gmail.com>
 <CAHCN7xL59cXgbe1YTbNvTjptO9bMnuxprCP7ok5kRuc8UO9Fcw@mail.gmail.com>
 <D7B54A39-D8A3-4EDF-8B47-66D59319B3F4@goldelico.com> <F65E947E-784A-4540-B926-BF3ECB0C01EC@goldelico.com>
 <285FED38-2B2B-4813-9FD2-396C53E9B1B2@goldelico.com> <CAHCN7xKyTnNojwRqsXcE1AsDKtJikBpXoUo8ED=89ZR9-ko9hA@mail.gmail.com>
 <65A23326-70B4-46E3-992D-74256B056900@goldelico.com> <CAHCN7xLGx0S3xyd0q-N8pgY8VdBbUUaJdgoxkKxakR59sH+zXQ@mail.gmail.com>
 <BF829797-492C-4120-AC69-F8B83572FD38@goldelico.com> <D3E8B5DC-AB53-4F46-8ABB-F839A11EB31C@goldelico.com>
In-Reply-To: <D3E8B5DC-AB53-4F46-8ABB-F839A11EB31C@goldelico.com>
From:   Adam Ford <aford173@gmail.com>
Date:   Wed, 11 Sep 2019 12:49:53 -0500
Message-ID: <CAHCN7xKq1CszKxax+7sG4O_V+iBYLSDVtDC480gvGV+KVb2-sw@mail.gmail.com>
Subject: Re: [Letux-kernel] [RFC PATCH 0/3] Enable 1GHz support on omap36xx
To:     "H. Nikolaus Schaller" <hns@goldelico.com>
Cc:     Nishanth Menon <nm@ti.com>,
        Linux-OMAP <linux-omap@vger.kernel.org>,
        Tony Lindgren <tony@atomide.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        =?UTF-8?Q?Andr=C3=A9_Roth?= <neolynx@gmail.com>,
        Discussions about the Letux Kernel 
        <letux-kernel@openphoenux.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Wed, Sep 11, 2019 at 12:43 PM H. Nikolaus Schaller <hns@goldelico.com> w=
rote:
>
> Hi Adam,
>
> > Am 11.09.2019 um 18:01 schrieb H. Nikolaus Schaller <hns@goldelico.com>=
:
> >
> >>
> >> Am 11.09.2019 um 17:56 schrieb Adam Ford <aford173@gmail.com>:
> >>
> >>> There are some subtleties for testing.
> >>>
> >>> * I have added turbo-mode; to OPP6 / OPP1G
> >>> * which means they are available but not used by the ondemand govenor
> >>> * to enable them one has to echo 1 >/sys/devices/system/cpu/cpufreq/b=
oost
> >>
> >> Will that be documented somewhere? If not, can we put a comment in the
> >> device tree so people know how to enable it?
> >
> > It seems to be pretty standard on i86 systems if you google for "turbo =
mode".
> > I have added it to the commit message which adds the vbb regulator.
>
> And, I am not sure if DT maintainers will accept comments about the
> Linux /sys implementation in device tree files or bindings. Those
> should be independent of Linux.

OK.
>
> Basically the turbo-mode property is a hint to the OPP system (which
> may or may not use of it).
>
> So I think it is indeed better to have it in the commit message and
> not the code.

That makes sense.

>
> One more thought: as long as we do not have junction temperature monitori=
ng
> we should keep it off by default... We may even remove the turbo-mode
> designator if we have the 90=C2=B0C limit and smart reflex working.

We're almost there!

adam
>
> BR,
> Nikolaus
>

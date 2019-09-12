Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3DBE2B1495
	for <lists+linux-omap@lfdr.de>; Thu, 12 Sep 2019 20:52:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725995AbfILSwU (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 12 Sep 2019 14:52:20 -0400
Received: from mail-io1-f68.google.com ([209.85.166.68]:46020 "EHLO
        mail-io1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727448AbfILSwU (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Thu, 12 Sep 2019 14:52:20 -0400
Received: by mail-io1-f68.google.com with SMTP id f12so57234298iog.12;
        Thu, 12 Sep 2019 11:52:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=3M0DBEXT0zXnU4neN83IHPC2RjV0S6rYgjI5uWAT12I=;
        b=NgcPydo2tnBFyQ8PRGmVKYOa/CjQWPcH+rPzJRym1Kpcnvg3TXtgXj3tQSFgtOn/Du
         v05IkAQjclxPsKgqnGm+5iLzfl8JkJOH6nwW7zkxMWF/psBTsuhIGxTuHnakVp2fjI3d
         u/cGqgSTa/eUC7cByKpZTl+XSFz2SJHJ6XEyk9H/F5UDNJRvfNoNeznLDWZ3GvovqOi5
         S0m4LwYNSWvMu3CKm3oAn793ElqUZxImpyHq67UPNFEP1yoJ7RQzOkLCdZPOlZp+6BLN
         bA9hqoAmjnhzopAq8fzWR6BXYu8QEWI/ZxcR8/mGTpp4jAuhKXXlHRp5OQPMcw4v8KSC
         77BQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=3M0DBEXT0zXnU4neN83IHPC2RjV0S6rYgjI5uWAT12I=;
        b=H4HsxlUvogynBiTPGqIoNWDTIn9dHV4/SXfJsMpxX1MVqz6jJB45zIPoNXc0oD+XQS
         JyfdT7nhaCep7/np2gJZuvbKMqH2pUmVMoID8XUZ4QEO6HlS9RbKRckg2cELHBDXBRN2
         7CFUUS9P0ce+VN4UJ8z8D5FhducwzsesDg5tgxmN1hzzMuw0JAe6igxa4nBF0JDj6FB0
         diao5N0jGNeKICr7rMFLINz0PLry9tjGAlWcBbnFuDMLgSrCJrkIMG0RsH8XHimBt9IX
         89xITuqXeslAVrxbir3u7EsjVH2oiSU31FUnpH5o+43Bip0yNsTRAeGO9sYH+NHoKRql
         xsJQ==
X-Gm-Message-State: APjAAAUASSWKNtZcQnQMY1PY2Stjqepgx3x9Rtju38n0XuWKLNwqTjjq
        j2V092/Pve6F0aCHN1RILDe11lX5ONVUUpZu8IQ=
X-Google-Smtp-Source: APXvYqwwVFw6gGI305ZlvQKdfT14pyiI8jfNuGBQTI0oraMAxLIkKvfVTtMjr22umZkSUMCYU7LMnot5boJy+3kYV0o=
X-Received: by 2002:a5e:dc47:: with SMTP id s7mr4463354iop.228.1568314338240;
 Thu, 12 Sep 2019 11:52:18 -0700 (PDT)
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
 <CAHCN7xKq1CszKxax+7sG4O_V+iBYLSDVtDC480gvGV+KVb2-sw@mail.gmail.com> <CAHCN7xJgOhCpsiSvxOHeRz+621+t53pyt4_iE1PNCigznb1GLw@mail.gmail.com>
In-Reply-To: <CAHCN7xJgOhCpsiSvxOHeRz+621+t53pyt4_iE1PNCigznb1GLw@mail.gmail.com>
From:   Adam Ford <aford173@gmail.com>
Date:   Thu, 12 Sep 2019 13:52:06 -0500
Message-ID: <CAHCN7xK=4JusZ-6r0qe0SBBb0KzVBguXWtw236kO5UQ4F=Jsig@mail.gmail.com>
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

On Thu, Sep 12, 2019 at 8:58 AM Adam Ford <aford173@gmail.com> wrote:
>
> On Wed, Sep 11, 2019 at 12:49 PM Adam Ford <aford173@gmail.com> wrote:
> >
> > On Wed, Sep 11, 2019 at 12:43 PM H. Nikolaus Schaller <hns@goldelico.co=
m> wrote:
> > >
> > > Hi Adam,
> > >
> > > > Am 11.09.2019 um 18:01 schrieb H. Nikolaus Schaller <hns@goldelico.=
com>:
> > > >
> > > >>
> > > >> Am 11.09.2019 um 17:56 schrieb Adam Ford <aford173@gmail.com>:
> > > >>
> > > >>> There are some subtleties for testing.
> > > >>>
> > > >>> * I have added turbo-mode; to OPP6 / OPP1G
> > > >>> * which means they are available but not used by the ondemand gov=
enor
> > > >>> * to enable them one has to echo 1 >/sys/devices/system/cpu/cpufr=
eq/boost
> > > >>
> > > >> Will that be documented somewhere? If not, can we put a comment in=
 the
> > > >> device tree so people know how to enable it?
> > > >
> > > > It seems to be pretty standard on i86 systems if you google for "tu=
rbo mode".
> > > > I have added it to the commit message which adds the vbb regulator.
> > >
> > > And, I am not sure if DT maintainers will accept comments about the
> > > Linux /sys implementation in device tree files or bindings. Those
> > > should be independent of Linux.
> >
> > OK.
> > >
> > > Basically the turbo-mode property is a hint to the OPP system (which
> > > may or may not use of it).
> > >
> > > So I think it is indeed better to have it in the commit message and
> > > not the code.
> >
> > That makes sense.
> >
> > >
> > > One more thought: as long as we do not have junction temperature moni=
toring
> > > we should keep it off by default... We may even remove the turbo-mode
> > > designator if we have the 90=C2=B0C limit and smart reflex working.
>
> I found some info on the thermal framework [1].  It seems to show that
> we can put placeholders in the device tree to help facilitate this.
>
> An excerpt from [1]  shows:
>      Cooling devices provide control on power dissipation.
>      There are essentially two ways to provide control on power dissipati=
on.
>      First is by means of regulating device performance, which is
> known as passive cooling (DVFS).
>      ... [snip stuff about cooling fans]
>
> It also shows there are ways to link the cpu node to the cooling info.
> Since it shows DVFS can be used to regulate temperature, it seems like
> the hooks might already be in place
>
> [1] - https://blog.linuxplumbersconf.org/2015/ocw//system/presentations/2=
613/original/thermal-framework-status-no-transitioning.pdf
>
> The downside is that the OMAP thermal sensor is unreliable.

I submitted an RFC for thermal throttling.  I am not sure if I did it
right, and I don't have a good way to test it.

adam


> >
> > We're almost there!
> >
> > adam
> > >
> > > BR,
> > > Nikolaus
> > >

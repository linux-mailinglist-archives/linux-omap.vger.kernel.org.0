Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 07327B230E
	for <lists+linux-omap@lfdr.de>; Fri, 13 Sep 2019 17:11:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388170AbfIMPLf (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 13 Sep 2019 11:11:35 -0400
Received: from mail-io1-f66.google.com ([209.85.166.66]:41881 "EHLO
        mail-io1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388211AbfIMPLe (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Fri, 13 Sep 2019 11:11:34 -0400
Received: by mail-io1-f66.google.com with SMTP id r26so63126460ioh.8
        for <linux-omap@vger.kernel.org>; Fri, 13 Sep 2019 08:11:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=mMvrolpZictsp0vcsnA439WHJN6VazlWfkqCTVMaJ18=;
        b=Q4o8MOrcV7wEiSL8OeQZ81/0lAc+RejvSKnrttWS2SFoFR64ZA1IaQgSJBkK2GN+50
         SQKP5T8Pif4V9w82Bs85UcpBl3gVWj4FW9BU79sX2RROleiEONemjmi96p/6JeqUu/96
         Tv3fNahITQYZaycVB26/sZMi6lLyJElfbVPnHwNg5mYDnODnoqAk6lCeXnECn0Gk6/YX
         xwPL/xFa0hoiE6uysgnE9yoAXybGqx45GzL0Fv3/k6N2Ss7YIOQjx8SNyQeG35akObeD
         I48LQPzMq9ByueSf1nPG+7xgl9M8Uu3qOBX7/hlOmDy2abfw+Cc/eu5NIBslUP58B2Bs
         igdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=mMvrolpZictsp0vcsnA439WHJN6VazlWfkqCTVMaJ18=;
        b=P1oBWjXR5n42UWCQgAJn/+slIxJEiOLIliTKMIZcHrDFmkbTWkKQmCHu3WtTU8+7AU
         bTHJL/toPsCeDFvQdx0gfEykdJ07gYxRAW6CvA3g4N5+bZX69c6+0DwgsA9Xgh4KZiZE
         FaJWnAUxaTIQa1o5G2T/rg0m9xyhNLjebSzS8rzu15VdKvgAaGGg5PvqGfkFFdvfQGpM
         Ui6yLm0rkSsaxWXu96+Wb5S+S6vz4sYkuF6QKGcV+5YYL4qk7TfBmECD/h7o9ZgP9Se4
         fz3hwedLtIe/tA/O2+C9yQ71SfDr0iILH1ApMH+NAcYPKCnjKedn7YlWvFc1iKK41mcz
         /5gA==
X-Gm-Message-State: APjAAAVC8LpuQcg+QaBb3NFuNGvMbRy25Xk7rAe73ZCPXpsuXL2BjIZ0
        dHBqDpixSpp0oyJ3ku4flQlIpGosZ9rJLDbFXcI=
X-Google-Smtp-Source: APXvYqwg1b8JOuGD1khBTu2NdeWJ8zoK/q4xdCG1EtENfPvGPZ7lf5eC4XfwBU+ueiNWo+YAxTP8qZ9XchiZQf10Duo=
X-Received: by 2002:a6b:cd81:: with SMTP id d123mr347064iog.78.1568387493695;
 Fri, 13 Sep 2019 08:11:33 -0700 (PDT)
MIME-Version: 1.0
References: <20190801012823.28730-1-neolynx@gmail.com> <20190801012823.28730-2-neolynx@gmail.com>
 <CAHCN7x+Vd+ECoa4fmUfoX47znag+NxKSzRt3iouQCZ2CQ2T--A@mail.gmail.com> <20190912210937.GU52127@atomide.com>
In-Reply-To: <20190912210937.GU52127@atomide.com>
From:   Adam Ford <aford173@gmail.com>
Date:   Fri, 13 Sep 2019 10:11:22 -0500
Message-ID: <CAHCN7xLh+6rdfjaXJJxv_s82OhPiVGhksu2L+krZAnYCTnpijw@mail.gmail.com>
Subject: Re: [PATCH 1/3] OMAP3: PM: Set/clear T2 bit for Smartreflex on TWL
To:     Tony Lindgren <tony@atomide.com>
Cc:     =?UTF-8?Q?Andr=C3=A9_Roth?= <neolynx@gmail.com>,
        Linux-OMAP <linux-omap@vger.kernel.org>,
        Nishanth Menon <nm@ti.com>, Kevin Hilman <khilman@ti.com>,
        Thara Gopinath <thara@ti.com>,
        Shweta Gulati <shweta.gulati@ti.com>,
        arm-soc <linux-arm-kernel@lists.infradead.org>,
        "H. Nikolaus Schaller" <hns@goldelico.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Thu, Sep 12, 2019 at 4:09 PM Tony Lindgren <tony@atomide.com> wrote:
>
> * Adam Ford <aford173@gmail.com> [190912 19:00]:
> > On Wed, Jul 31, 2019 at 8:29 PM Andr=C3=A9 Roth <neolynx@gmail.com> wro=
te:
> > >
> > > From: Thara Gopinath <thara@ti.com>
> > >
> > > Voltage control on TWL can be done using VMODE/I2C1/I2C_SR.
> > > Since almost all platforms use I2C_SR on omap3, omap3_twl_init by
> > > default expects that OMAP's I2C_SR is plugged in to TWL's I2C
> > > and calls omap3_twl_set_sr_bit. On platforms where I2C_SR is not conn=
ected,
> > > the board files are expected to call omap3_twl_set_sr_bit(false) to
> > > ensure that I2C_SR path is not set for voltage control and prevent
> > > the default behavior of omap3_twl_init.
> > >
> > > Signed-off-by: Nishanth Menon <nm@ti.com>
> > > Signed-off-by: Thara Gopinath <thara@ti.com>
> > > Signed-off-by: Shweta Gulati <shweta.gulati@ti.com>
> > > Cc: linux-arm-kernel@lists.infradead.org
> > > Signed-off-by: Kevin Hilman <khilman@ti.com>
> >
> > Tony,
> >
> > Is there a status update on this series?  It's been several months,
> > and I haven't seen any feedback on it, nor does it appear to be in any
> > of your branches that I can see.
>
> Well it was tagged RFC.. Does something need updating
> with it?

I didn't notice the RTC until you pointed out the 0/3 file showed the RFC.

Andre -  since you have sign-off by various TI people and Tony seems
satisfied, would you be will to re-base and push the patch series
without the RFC?

I think some of the work that H Nikolaus Schaller is doing will
benefit from this.

Thank you,

adam
>
> At least the first two patches looked OK to me.
>
> Regards,
>
> Tony

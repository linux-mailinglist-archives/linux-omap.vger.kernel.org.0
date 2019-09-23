Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 839F4BB548
	for <lists+linux-omap@lfdr.de>; Mon, 23 Sep 2019 15:31:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2407793AbfIWNbb (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 23 Sep 2019 09:31:31 -0400
Received: from mail-io1-f67.google.com ([209.85.166.67]:40495 "EHLO
        mail-io1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2407699AbfIWNbb (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Mon, 23 Sep 2019 09:31:31 -0400
Received: by mail-io1-f67.google.com with SMTP id h144so33353684iof.7;
        Mon, 23 Sep 2019 06:31:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=3+RYvpW6t7ADMYkerd+xeHNQ43Bh09ixj7XaFyC3Hbg=;
        b=eWy408zz+ozFC/Lbg71VkerP1XtastaivcX61SsWwiN++zVJvIWGdrzjGsNScWdqY7
         G3uNY1yjn2gyuy7bOSbCkyn/SoboYis22Z9Dj0Aj17NSHRJIuccQihnCvHwH3pDdjkNX
         cGnuILaR3IRK/jPlERiwWz0p1QvvzDDh3VeMU8TNLUuB+85zTMc1FJenUfVbx2paHF6X
         FcaBrAg6Q5KbtvIiarsSq8fsHBPtN14ytb1U+37xsmuI8rUpKRjns34ZsFnq9NXP6ZVK
         Qa+qKAsHK+d5P5u64lVZzt1HJ1u7JxZpA4Q2z0kaCpfSliUOo0s3kuTGx+b/aoeWXoJB
         WSEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=3+RYvpW6t7ADMYkerd+xeHNQ43Bh09ixj7XaFyC3Hbg=;
        b=P/QxnNt07+sIY9nFNSTmmusslMaIk8YzvIc82Z4u+Hrlrp/eEXlZMaMv/x7riQa6UH
         gjK63MQu7QiJLV6vcCM6OtOUbBd9hYrdqeQwmTU6iDr4krt9KCCK8ZHZNBLhfxbINqlw
         MW7dakpisStZxY+YU63xfwBH7p/Jp+Mv+LTJMB4EhU2jtIqK0NYx0hDmAgctICag/HjR
         1dB4hGonIcw8isyT15PxZcImFtRFQJpEuZztP7h88QxWJBUy2as3JOIManSLfuq9flrI
         FkhdGqCnowv3gtwvAYM4NxMsIcRO2Yu0NbqcekHY/kjsIPfMmcakN1vJiaLG/LnSDzFa
         XAoQ==
X-Gm-Message-State: APjAAAUmUo8vFE4JvYCyvQWGGS3TcK7BZebxPPN0sXrlRjnuvT8/873q
        nNIJUvuwWUcd5jBh3CPGMCUy8J+9+v2swmpSeGo=
X-Google-Smtp-Source: APXvYqw0DEPqirZ/GJL7O38ranF6+/QvHWDJuhu5rwTfjUDwNPVY+dYgCxKdkvUwJorgBrV31AVMzJLj+DOAzQ5GmOg=
X-Received: by 2002:a02:6017:: with SMTP id i23mr36944468jac.0.1569245490276;
 Mon, 23 Sep 2019 06:31:30 -0700 (PDT)
MIME-Version: 1.0
References: <20190917161214.2913-1-aford173@gmail.com> <20190917161214.2913-2-aford173@gmail.com>
 <20190921190708.GB32133@ravnborg.org>
In-Reply-To: <20190921190708.GB32133@ravnborg.org>
From:   Adam Ford <aford173@gmail.com>
Date:   Mon, 23 Sep 2019 08:31:18 -0500
Message-ID: <CAHCN7x+j9dsn8R202Y_rQUzO8g3SFatt8TzWUYsgADqCnTR=-Q@mail.gmail.com>
Subject: Re: [PATCH 2/3] dt-bindings: Add Logic PD Type 28 display panel
To:     Sam Ravnborg <sam@ravnborg.org>
Cc:     dri-devel@lists.freedesktop.org,
        Linux-OMAP <linux-omap@vger.kernel.org>,
        Adam Ford <adam.ford@logicpd.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        devicetree <devicetree@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Sat, Sep 21, 2019 at 2:07 PM Sam Ravnborg <sam@ravnborg.org> wrote:
>
> Hi Adam.
>
> Good with even more panels.
> But for new bindings please use meta-schema (.yaml) format.
> This is what we use for new bindings as it allows better
> validation.

I don't know that syntax, but I'll try to piece together a few
different examples to come up with something.  I should have a V2
today.

adam
>
>         Sam
>
> On Tue, Sep 17, 2019 at 11:12:12AM -0500, Adam Ford wrote:
> > This patch adds documentation of device tree bindings for the WVGA panel
> > Logic PD Type 28 display.
> >
> > Signed-off-by: Adam Ford <aford173@gmail.com>
> >
> > diff --git a/Documentation/devicetree/bindings/display/panel/logicpd,type28.txt b/Documentation/devicetree/bindings/display/panel/logicpd,type28.txt
> > new file mode 100644
> > index 000000000000..829fc5210e06
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/display/panel/logicpd,type28.txt
> > @@ -0,0 +1,26 @@
> > +Logic PD Type 28 4.3" WQVGA TFT LCD panel
> > +
> > +This binding is compatible with the simple-panel binding, which is specified
> > +in simple-panel.txt in this directory.
> > +
> > +Required properties:
> > +- compatible: should be "logicpd,type28"
> > +
> > +Optional properties:
> > +- power-supply: regulator to provide the supply voltage
> > +- enable-gpios: GPIO pin to enable or disable the panel
> > +- backlight: phandle of the backlight device attached to the panel
> Is it correct that these are optional for the descrivbed panel?
>
> > +
> > +Optional nodes:
> > +- Video port for RGB input.
> > +
> > +Example:
> > +     lcd0: display {
> > +             compatible = "logicpd,type28";
> > +             enable-gpios = <&gpio5 27 GPIO_ACTIVE_HIGH>;
> > +             port {
> > +                     lcd_in: endpoint {
> > +                             remote-endpoint = <&dpi_out>;
> > +                     };
> > +             };
> > +     };
> > --
> > 2.17.1

Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EF4BF20FF62
	for <lists+linux-omap@lfdr.de>; Tue, 30 Jun 2020 23:45:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729894AbgF3Vmg (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 30 Jun 2020 17:42:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35836 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729881AbgF3Vmf (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 30 Jun 2020 17:42:35 -0400
Received: from mail-ej1-x644.google.com (mail-ej1-x644.google.com [IPv6:2a00:1450:4864:20::644])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 22C22C03E97A
        for <linux-omap@vger.kernel.org>; Tue, 30 Jun 2020 14:42:35 -0700 (PDT)
Received: by mail-ej1-x644.google.com with SMTP id rk21so22196450ejb.2
        for <linux-omap@vger.kernel.org>; Tue, 30 Jun 2020 14:42:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=beagleboard-org.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=9KeedTR4d1M1A9lgyC4RIPQ4BDuEfuh1R0OQqgZUzi0=;
        b=sL1VXfAPgIwpkRUrHOBR0S3KARGoo22IZpw9Ln2g/8uJA+D8cryT0fwcS0mYEYkDzG
         yDLdBOh9q71MnBNOFTtF3unADRfC9gu1GBSCTtGsBgHS9W4mu5t3tnpxAPmNwTnskgOg
         TWLztxM8wF0bes2alk/X6xmeT/w7HGsFTAP9aHS7URr8YM32N2R6EUsq6g4f4QUgGMEg
         jC+kF4hshwIXAwkSQ6D7laY0O9CRdk/7l47RZfA9MYkQXo8AGYdrfFphSiBj1/CSAYgv
         M8ObwDuq30pWBlHirX5f+k+3nE9rAnR4cJ68dXg/jRkbS6wRCI8Kc38ZpYV+0kkQCvMQ
         //Ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=9KeedTR4d1M1A9lgyC4RIPQ4BDuEfuh1R0OQqgZUzi0=;
        b=ilXar6Veqr3wkngg8XRUHjq0Xh39c6VtyzS8UAjOh1jpVnm90v188OflWRE9djlOyx
         KAB8wKY2hjnTqIOltwqTJilP/+y5SFkNDQ43raWELEmMgiE7MvaFXQ0deHNsCQV7Z9Wy
         orxMVSOjHh3vUi41Rwjflfz1w19k0oh8lPdaOtCNXO1Eb0nis2sLx68zeG6NsZR+MvuP
         bJ6UUPyHsL3HMKLVS2c8+YOR88qcLHpbwmQTasjDTWcas3eKKTEKrFx2khUmReoAXYMK
         bFkS15+hXSAQTdYZu56xeGsGdbfTggkbSf4Wr146afA6g4H1cY3y7OJYUfqn8M51WRhn
         8Msg==
X-Gm-Message-State: AOAM5301T++fBJIwcy0O4yqkhT/jACiE+tLXXNUrmGOwv3U+rluuUv7e
        JJJZf2/4y5ySzCJM1gmWD7MMsA==
X-Google-Smtp-Source: ABdhPJwD7IscC90qcbmTMPk4qGK1hD1gSWxsH3Y+4s9sG7AqHB/LiBso4JvYQ5CVJ4vCPdVo2IZqJw==
X-Received: by 2002:a17:906:95d9:: with SMTP id n25mr20683406ejy.437.1593553353709;
        Tue, 30 Jun 2020 14:42:33 -0700 (PDT)
Received: from x1 ([2001:16b8:5c28:7601:2d3c:7dcb:fbf0:3875])
        by smtp.gmail.com with ESMTPSA id cw19sm3024133ejb.39.2020.06.30.14.42.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jun 2020 14:42:33 -0700 (PDT)
Date:   Tue, 30 Jun 2020 23:42:31 +0200
From:   Drew Fustini <drew@beagleboard.org>
To:     Tony Lindgren <tony@atomide.com>
Cc:     Rob Herring <robh+dt@kernel.org>, bcousson@baylibre.com,
        linux-omap@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Jason Kridner <jkridner@beagleboard.org>,
        Robert Nelson <robertcnelson@gmail.com>,
        "H . Nikolaus Schaller" <hns@goldelico.com>,
        Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v2] ARM: dts: am335x-pocketbeagle: set default mux for
 gpio pins
Message-ID: <20200630214231.GA116238@x1>
References: <20200628152442.322593-1-drew@beagleboard.org>
 <20200629170358.GT37466@atomide.com>
 <20200630020102.GA45128@x1>
 <20200630182037.GF37466@atomide.com>
 <20200630213155.GA115731@x1>
 <20200630213423.GG37466@atomide.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200630213423.GG37466@atomide.com>
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Tue, Jun 30, 2020 at 02:34:23PM -0700, Tony Lindgren wrote:
> * Drew Fustini <drew@beagleboard.org> [200630 21:32]:
> > On Tue, Jun 30, 2020 at 11:20:37AM -0700, Tony Lindgren wrote:
> ...
> > > > > Needing to change the dts does not sound good to me.. But maybe you mean
> > > > > this is needed until the gpio-omap and pinctrl-single patches are merged?
> > > >
> > > > I agree that I would like for userspace to be able to do run-time
> > > > changes.  However, I think something would need to be added to the
> > > > pinconf support in pinctrl-single for that to be possible.  There are
> > > > bias properties but non for receiver enable.
> > > > 
> > > > Does it seem sensible to add that?
> > > 
> > > Well let's see with Linus W says. To me it seems this might be a good
> > > reason to allow a sysfs interface to change the pinctrl if we don't
> > > have it yet? With the proper gpio line naming it should be quite simple
> > > to use too :)
> > 
> > I think if pinctrl-single allowed mux to be set through debugfs that
> > could be one solution to the use case of users prototyping with a
> > beaglebone.  Maybe that could be acceptable?
> 
> I think this should not depend on debugfs though, it should be a
> generic interface.

Ok, thanks.  I'm trying to imagine a solution as there no existing
pinctrl uAPI.  gpiod uAPI has gained some pinctrl functionality with
the work that Kent Gibson has been doing beyond just bias flags.

Do you think trying to plumb this through gpio-omap is a reasonable
approach?

thanks,
drew

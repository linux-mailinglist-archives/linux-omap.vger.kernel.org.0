Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5540F8D6B7
	for <lists+linux-omap@lfdr.de>; Wed, 14 Aug 2019 16:56:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726619AbfHNO4w (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 14 Aug 2019 10:56:52 -0400
Received: from mail-pf1-f195.google.com ([209.85.210.195]:39782 "EHLO
        mail-pf1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726019AbfHNO4w (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Wed, 14 Aug 2019 10:56:52 -0400
Received: by mail-pf1-f195.google.com with SMTP id f17so49728995pfn.6
        for <linux-omap@vger.kernel.org>; Wed, 14 Aug 2019 07:56:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=message-id:mime-version:content-transfer-encoding:in-reply-to
         :references:subject:from:cc:to:user-agent:date;
        bh=F1GjfCc2krRsyUeVwEv+ETsarz/0iBe3cVZ9IWqsuE4=;
        b=OgoALIDSa27QJkQOovdQN7tDVvKvC7JT/uR0Vr77J4sHjRPiIQf5z29tSucW9dpJtS
         5D+1w5dhaBHMcUc8M6WnqmqTFJZQk9d/X5a17RFGhlPYkBFRWI+fK+n15xoATY7dPaLv
         z06mTqEstQHnYhwgdNnyuXEYaygB+jTBbFzp4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:mime-version
         :content-transfer-encoding:in-reply-to:references:subject:from:cc:to
         :user-agent:date;
        bh=F1GjfCc2krRsyUeVwEv+ETsarz/0iBe3cVZ9IWqsuE4=;
        b=G6SzFbISVeOfCRCWVCMC3qvaTiB9ZJvzSUzOhPUEp9dZ6w7O+PyYLdkdWrIyi0At15
         D0/YGRb8Im5E6XjNJM8e2uEHD6DRdRWmknIm3FcJdv39QZlI93+RU/dG/lTRYoh2OhIf
         n3VZryxYBgyWthJRpsR8xo2gGLk54hDfpH3kDxHjZ0YI9CCxaOWmKTWffBvRJ6QPZY/f
         Dgybjie4Mw+2xdE1qNr5pUBEyOLRlYsNGm10VZjG/H+M6K7n/J+m/Engdi8kHRoViT0z
         N/e7H/3P/zvzWVNmfEHAN+NnIq0TpI/Fa40cNvo3IqXpoIQRZrQJxZwkiRunRx2BEJB6
         +f5g==
X-Gm-Message-State: APjAAAX6wkKppW5Mm2AdfzAbTbYmwbuBm8UrQNUhWpfUJlxL8NgTKrK/
        NOHJsK2a4GM4PXS3RhK82gQh+Q==
X-Google-Smtp-Source: APXvYqwQBr4lyDRs7b6AInnwp0mZfbr70TLkQcTPjskS6KrON2YWuEVTwXqWbAwfbbq6CAKITZkU4w==
X-Received: by 2002:a65:52ca:: with SMTP id z10mr40206305pgp.424.1565794611658;
        Wed, 14 Aug 2019 07:56:51 -0700 (PDT)
Received: from chromium.org ([2620:15c:202:1:fa53:7765:582b:82b9])
        by smtp.gmail.com with ESMTPSA id c5sm16888pfo.175.2019.08.14.07.56.50
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Wed, 14 Aug 2019 07:56:51 -0700 (PDT)
Message-ID: <5d542133.1c69fb81.f5f57.0098@mx.google.com>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20190814073234.GZ52127@atomide.com>
References: <20190814063803.GY52127@atomide.com> <5d53b378.1c69fb81.31b2e.5077@mx.google.com> <20190814073234.GZ52127@atomide.com>
Subject: Re: Regression in Linux next with show wakeup sources stats in sysfs
From:   Stephen Boyd <swboyd@chromium.org>
Cc:     "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Kalesh Singh <kaleshsingh@google.com>,
        Tri Vo <trong@android.com>, linux-omap@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-pm@vger.kernel.org, Sebastian Reichel <sre@kernel.org>
To:     Tony Lindgren <tony@atomide.com>
User-Agent: alot/0.8.1
Date:   Wed, 14 Aug 2019 07:56:50 -0700
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Quoting Tony Lindgren (2019-08-14 00:32:34)
> * Stephen Boyd <swboyd@chromium.org> [190814 07:09]:
> > Quoting Tony Lindgren (2019-08-13 23:38:03)
> > > Hi all,
> > >=20
> > > Looks like commit 986845e747af ("PM / wakeup: Show wakeup sources sta=
ts
> > > in sysfs") has caused a regression in Linux next where I can now get
> > > some errors like this during the boot:
> > >=20
> > > kobject_add_internal failed for wakeup10 (error: -2 parent: usb)
> > >=20
> > > Any ideas why this might be happening? Maybe some deferred probe
> > > related issue?
> > >=20
> >=20
> > Yeah! Take a look at this thread[1] and please test out patches I'm
> > throwing out there like a total cowboy(d).
> >=20
> > [1] https://lkml.kernel.org/r/1565731976.8572.16.camel@lca.pw
>=20
> Oh OK thanks, looks like I'm a bit behind then. My test case turned
> out to be caused by device_init_wakeup() called before device_add() for
> power_supply in case that helps. In that case create_dir() will fail
> for kobject_add_internal(). Doing something like below fixes the
> issue, but seems like we probably have other similar issues as well.
> Adding Sebastian to Cc in case this might be a real problem despite
> the other issues.
>=20

Ah yeah. I sent a patch for power supply earlier[2], but now I'm
thinking that it would be better to take the approach in the thread I
mentioned where we just don't add sysfs stuff until when device_add() is
called.

[2] https://lkml.kernel.org/r/20190801213330.81079-1-swboyd@chromium.org

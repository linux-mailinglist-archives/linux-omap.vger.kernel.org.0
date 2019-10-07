Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AECDBCE9EB
	for <lists+linux-omap@lfdr.de>; Mon,  7 Oct 2019 18:57:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728162AbfJGQ51 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 7 Oct 2019 12:57:27 -0400
Received: from mail-wr1-f65.google.com ([209.85.221.65]:44235 "EHLO
        mail-wr1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727935AbfJGQ51 (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Mon, 7 Oct 2019 12:57:27 -0400
Received: by mail-wr1-f65.google.com with SMTP id z9so16143965wrl.11;
        Mon, 07 Oct 2019 09:57:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
        bh=EGIejddfLAJpf9sVwGueon/dDKY2GtQH18Tsw28Siug=;
        b=b95EUpLOK9666SITwUpVBSwU2pywae50FdIH9QYz/Z34kYcrNGLRsRUx9dTkdlKZmq
         LWrFj2emjChmIG9Rd7BWrjnQ+xtsiBdkCk2I3IDigUSTnk55zqzhgn5A+sY4nbcNxjQY
         A3oslNZ/u1H07qzks+yqcy+BPmyNtVLxx9oOVKQfwrLSB30m7DJY7+SU0az9FjV1WQ3U
         gT8U+KlzZ5SRGt10EvTynQdjuoXom2rg1xJSENIwBlegMTZXApv+L4C49QIePR5R/OEE
         JHvYP4pxsvXwufsKkDvV17pJ0A4gIGOUp+8qIxXRN0OTxqlVifLVij2usGuJNinsWcpZ
         V8/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to;
        bh=EGIejddfLAJpf9sVwGueon/dDKY2GtQH18Tsw28Siug=;
        b=X/tbdjg/tI+5YhdAkeqwnHoCHzxbxrniYN3askFg7cFxaMjwZiv+5rQNyzMg/e1d2E
         eDDjhRSJ7fVgSUShkNGMQBSgJWZSzs16cAbNWxrCTZHT8F7fQkefwh26NFsgvFfT4lQ1
         lzl1bY6pX8Z6+9mvSebK0Gts8Nw6ah7L0R0fakfsQy8AigZZ/4tw/Umlh7Wu9O93qJ3F
         m5lHjAVEoYN1Zm/qg4O8W47s71Fy5j4hK046xRFdNQBNYeHge+47bScTgJntIg4YCDIt
         eN5DjFshb8J6xVvpYvAr9tkcKmw8FOGqfFB+Kjt6YGLwclG358d75BX92XsziGfcXfH+
         NR5A==
X-Gm-Message-State: APjAAAUBL534n7OrmzMX7MWhwsy6XaeEX7OIU5TPU6s22v6d2Ithwu8B
        W3IP6SCDFtlPWuzTPJ790siiWMo4w3jDSpAF0eYBQi41Js0=
X-Google-Smtp-Source: APXvYqyvFWpIhF+9Cosbi6sSUF5ovkjfFZymgTkrhevWZA7f6MkVr1y06JJgLo71q+gZ+qPpYIYW5zeMq7ElyYw0gGA=
X-Received: by 2002:a5d:67cc:: with SMTP id n12mr22272024wrw.359.1570467444847;
 Mon, 07 Oct 2019 09:57:24 -0700 (PDT)
MIME-Version: 1.0
References: <CALcgO_6UXp-Xqwim8WpLXz7XWAEpejipR7JNQc0TdH0ETL4JYQ@mail.gmail.com>
 <20190628110441.42gdqidkg5csuxai@valkosipuli.retiisi.org.uk> <20191007163404.GZ5607@atomide.com>
In-Reply-To: <20191007163404.GZ5607@atomide.com>
From:   Michael Allwright <allsey87@gmail.com>
Date:   Mon, 7 Oct 2019 18:56:59 +0200
Message-ID: <CALcgO_4Usn_OAwiCWpx45+_YRsTKiUpOYs9fCSbUbYjnvmrc-g@mail.gmail.com>
Subject: Re: [PATCH RFC] DT support for omap4-iss
To:     linux-media@vger.kernel.org, linux-omap@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Mon, 7 Oct 2019 at 18:34, Tony Lindgren <tony@atomide.com> wrote:
>
> Hi,
>
> * Sakari Ailus <sakari.ailus@iki.fi> [190628 11:05]:
> > Hi Michael,
> >
> > On Mon, Aug 10, 2015 at 05:16:30PM +0200, Michael Allwright wrote:
> > > Hi All,
> > >
> > > The following PRELIMINARY patch adds DT support to the OMAP4 ISS. It
> > > also fixes some problems a have found along the way. It is tightly
> > > modelled after the omap3-isp media platform driver. This patch is a
> > > work in progress as I would like feedback. It contains debugging
> > > messages that need to be removed, as well as disgusting abuses of the
> > > C language as required (i.e. clk_core_fake and clk_fake).
> >
> > We'd like to restart the effort adding DT support for this driver. Would
> > you be able to, if not address the comments, at least resend your old patch
> > with your Signed-off-by: line so we could make use of what you've already
> > done?
>
> I think this email no longer works for Michael? Adding another
> one from commit at [0] below.
>
> Michael, care to email that patch to the lists with your
> Signed-off-by so Sakari can use it? Or at least reply with
> your Signed-off-by to this thread :)
>
> Regards,
>
> Tony
>
> [0] https://github.com/allsey87/meta-builderbot/blob/master/recipes-kernel/linux/linux-stable-4.16/0008-omap4iss-Fix-multiple-bugs-and-use-device-tree.patch

Hi All,

Sorry for the lack of communication, indeed the University of Paderborn
email is no longer used. We ran out of time on our end to work on this.
Naturally I would be glad to see any efforts towards getting DT support
together for this driver. To that end, we release all the work we have
done, including the patch in [0], to the public domain.

Signed-off-by: Michael Allwright <michael.allwright@ulb.ac.be>

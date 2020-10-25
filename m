Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4F5942982AA
	for <lists+linux-omap@lfdr.de>; Sun, 25 Oct 2020 18:05:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1417502AbgJYRFp (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Sun, 25 Oct 2020 13:05:45 -0400
Received: from mail-lj1-f170.google.com ([209.85.208.170]:39276 "EHLO
        mail-lj1-f170.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1417500AbgJYRFp (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Sun, 25 Oct 2020 13:05:45 -0400
Received: by mail-lj1-f170.google.com with SMTP id m16so7236663ljo.6;
        Sun, 25 Oct 2020 10:05:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=ROy9c6DCwb7BqeE8H1DusDotQcpBT+t8lOOmjmIQsso=;
        b=MXLjSYKSekIkVeAJml7Rd18JfTX8ZFhjShcmkNDV54CtY/yX7Nw+rYCdeVu24qIPhj
         6QpF+FzFKmfrfT3IG2r8sqtB+OPXywNYvu8DrLXfbPDTuv1VChs9kP5zxkpJh7K6SbIe
         D7eGnebR2FQtv66z2iPBgVpD6IYYFisOw8irII1KRy6JuJBN3cprBNfWk8c3Ao5lo/Gs
         rFuUf3UO2w/Z8py6HW+HnA2t1C2MS7rlho/zAC7f26qq/Pb20MXZc1LNvS0n4vNDOCyk
         zoIKroCNKplDbJoNX3OyPvIoi71vzSuQ2xh3VrYcN06ts7Mg+RwbC8U2Ca3OQrEq5i0U
         L7uA==
X-Gm-Message-State: AOAM532nzg3VC1WRqL85xM7b0h1XgHX/8GjbYNZDOyWGNWIVomFz4mR6
        hr/GchPXBxq7L97svmSsQqs=
X-Google-Smtp-Source: ABdhPJyZsJ0KXIWx0VvyNrbAGN6S455M6+tpEVqIrL3N1jHU8GjpqzjpufuSs7aPj2BRg4Q9kTITDQ==
X-Received: by 2002:a2e:9c85:: with SMTP id x5mr4326967lji.92.1603645542357;
        Sun, 25 Oct 2020 10:05:42 -0700 (PDT)
Received: from xi.terra (c-beaee455.07-184-6d6c6d4.bbcust.telenor.se. [85.228.174.190])
        by smtp.gmail.com with ESMTPSA id g22sm783000lfh.31.2020.10.25.10.05.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Oct 2020 10:05:41 -0700 (PDT)
Received: from johan by xi.terra with local (Exim 4.93.0.4)
        (envelope-from <johan@kernel.org>)
        id 1kWjSj-0004jF-9z; Sun, 25 Oct 2020 18:05:45 +0100
Date:   Sun, 25 Oct 2020 18:05:45 +0100
From:   Johan Hovold <johan@kernel.org>
To:     Thomas Gleixner <tglx@linutronix.de>
Cc:     LKML <linux-kernel@vger.kernel.org>,
        Peter Zijlstra <peterz@infradead.org>,
        Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
        Johan Hovold <johan@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org,
        Thomas Winischhofer <thomas@winischhofer.net>,
        "Ahmed S. Darwish" <a.darwish@linutronix.de>,
        Mathias Nyman <mathias.nyman@intel.com>,
        Valentina Manea <valentina.manea.m@gmail.com>,
        Shuah Khan <shuah@kernel.org>,
        Alan Stern <stern@rowland.harvard.edu>,
        linux-omap@vger.kernel.org, Kukjin Kim <kgene@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, Felipe Balbi <balbi@kernel.org>,
        Duncan Sands <duncan.sands@free.fr>
Subject: Re: [patch V2 03/13] USB: serial: keyspan_pda: Consolidate room query
Message-ID: <20201025170545.GS26280@localhost>
References: <20201019100629.419020859@linutronix.de>
 <20201019101109.903651690@linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201019101109.903651690@linutronix.de>
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Mon, Oct 19, 2020 at 12:06:32PM +0200, Thomas Gleixner wrote:
> From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
> 
> Having two copies of the same code doesn't make the code more readable and
> allocating a buffer of 1 byte for a synchronous operation is a pointless
> exercise.

As Alan pointed out, this buffer is in fact required and not pointless
at all even if reallocating it may be suboptimal.

Note however that there are several further allocations done by
usb_control_msg() for each control request.

> Allocate a byte buffer at init which can be used instead. The buffer is
> only used in open() and tty->write(). Console writes are not calling into
> the query. open() obviously happens before write() and the writes are
> serialized by bit 0 of port->write_urbs_free which protects also the
> transaction itself.

As I mentioned in my comments to the previous patch, I've rewritten the
driver so that is no longer does this query in the write path. I kept
the buffer allocation for now though in case you want to rework this one
top.

Johan

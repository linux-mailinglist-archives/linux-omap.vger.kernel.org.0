Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 29B8521C1EA
	for <lists+linux-omap@lfdr.de>; Sat, 11 Jul 2020 05:34:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726588AbgGKDeK (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 10 Jul 2020 23:34:10 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:25644 "EHLO
        us-smtp-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1726707AbgGKDeJ (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Fri, 10 Jul 2020 23:34:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1594438449;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:mime-version:mime-version:content-type:content-type;
        bh=rkxV9wGrbaQjvlwNa9bpSRvCBx9BwmI9mcVo23t8Au0=;
        b=e7OiUGfaJZO8OFgtgbDyFz2BQj7h+eAk4I/yf8tEw/PtwFdQhUswvKLih/3QflmY1wwTs5
        ZlbJCekjPLpJTFoOJUXv0RX7oGavHcdPybkG1Y1BVMb476FoiQuyH+bEOcynbOrhZv7qu9
        Bx9qiNa/QCAP6CXkF56KZR8glFKGjGs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-328-keMQNT7LN7WgirSVBUnglg-1; Fri, 10 Jul 2020 23:34:05 -0400
X-MC-Unique: keMQNT7LN7WgirSVBUnglg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 75AD28015F7;
        Sat, 11 Jul 2020 03:34:03 +0000 (UTC)
Received: from dhcp-128-65.nay.redhat.com (ovpn-12-95.pek2.redhat.com [10.72.12.95])
        by smtp.corp.redhat.com (Postfix) with ESMTPS id 6699D5C240;
        Sat, 11 Jul 2020 03:34:00 +0000 (UTC)
Date:   Sat, 11 Jul 2020 11:33:56 +0800
From:   Dave Young <dyoung@redhat.com>
To:     Peter Ujfalusi <peter.ujfalusi@ti.com>,
        Jarkko Nikula <jarkko.nikula@bitmer.com>,
        alsa-devel@alsa-project.org, linux-omap@vger.kernel.org
Subject: omap-mcbsp 49022000.mcbsp: TX Buffer Overflow!
Message-ID: <20200711033356.GA164619@dhcp-128-65.nay.redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi,

I'm trying to use g_audio on my Nokia N900 with mainline kernel. Seems
it does not work.  No sound when I play from a laptop, and also see a
lot of error like below:
[ 4729.557647] omap-mcbsp 49022000.mcbsp: TX Buffer Overflow!
...


Is this a know issue?

Thanks
Dave


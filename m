Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5CBDD7C7813
	for <lists+linux-omap@lfdr.de>; Thu, 12 Oct 2023 22:50:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1347397AbjJLUuh (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 12 Oct 2023 16:50:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60048 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344156AbjJLUug (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Thu, 12 Oct 2023 16:50:36 -0400
Received: from mail-pg1-x52a.google.com (mail-pg1-x52a.google.com [IPv6:2607:f8b0:4864:20::52a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9EEAD9D
        for <linux-omap@vger.kernel.org>; Thu, 12 Oct 2023 13:50:35 -0700 (PDT)
Received: by mail-pg1-x52a.google.com with SMTP id 41be03b00d2f7-5a9bf4fbd3fso201650a12.1
        for <linux-omap@vger.kernel.org>; Thu, 12 Oct 2023 13:50:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1697143835; x=1697748635; darn=vger.kernel.org;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=kfzBGmddQTix4+dejvXuWg87PRHeA9TXCn5o9UdaswA=;
        b=beLTT+VHfDwTVHG6LIWgxApO0cI4dj7R2IeLKClnPweCITbT/rONxVgGAm261jw0Zo
         eiMJXXXcaMlPgDCqr76fbdt7jR30GjG7AOMerjnCoGjqPUzSn1TqcgOvucX7dMSlqkvd
         y3PW4jvaetInAiEcqaZAi5OyxGmRAjezTnkmDf7Fvmpth2vI9aKOkj0ojmwbfzaCrcYE
         bnbZFZ0lpmVnAD9q69FQ6xRt07jhnUxy0GfkJ9hsdbtnpHKqYsbySQnLwzm+uj9ItG61
         NGQSYBhQHrQl0jQDCPXpBRBBxX/bZ5S8ouO3lxFP97/SXBcNM0s8FPwkYwI95eDkt8Wx
         YhNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697143835; x=1697748635;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=kfzBGmddQTix4+dejvXuWg87PRHeA9TXCn5o9UdaswA=;
        b=U++wf2mq1VPhp+OGN4HNZVmM8R5SBiElt7NKiXFZorOlfs+VgvY7fAtGdKSF8Txawm
         mgXpcyfrPJmuO5ldJPK6yDXfryGAH/iDYKblV2pNuaAIA3nf+9dFzO84iWvg9TqhXcp7
         efWCc2gJ77z1AoD8A2GYlm86vwzPBbtdSeZbJ/+YXSHl9mZ+m9q0g8ijujIcPU5PM1Oe
         5Ozy59lYcGV3taYQIn0v7JZVtO5KkaSSIUjA5/c+nca6D02YwW4IANQNJl6Jqh3Rf6zs
         bYa98dJDoiUG3YRgkyVhV8A1HAcQM6bXqjRRWtXEwhB+q2Ki+5QPROZiplhir3PAeyxz
         AB9Q==
X-Gm-Message-State: AOJu0YwZl9CJagerW3AweplDRQa4NGNWaJwGS7YWY0deKHN0d5AS4UsA
        0DJReNEbUlIE9yltdxai1IvJtaSsug3fdT0XevNJtfDK05w=
X-Google-Smtp-Source: AGHT+IEgzsjfxjk20XZr0oO/XJU8RCSGMtyXXnKZ9HX0/jrKOaqU+huJ68XKOnjrcI/I9eWxnqFuUM4RFsLhvecbpXw=
X-Received: by 2002:a05:6a20:8f0c:b0:13f:9cee:ff42 with SMTP id
 b12-20020a056a208f0c00b0013f9ceeff42mr32406731pzk.41.1697143834632; Thu, 12
 Oct 2023 13:50:34 -0700 (PDT)
MIME-Version: 1.0
From:   Adam Ford <aford173@gmail.com>
Date:   Thu, 12 Oct 2023 15:50:23 -0500
Message-ID: <CAHCN7xJzt+d-azD4NrXj4RKpYL+v0pYQC9C8F-hgxcritJxWUA@mail.gmail.com>
Subject: OMAP3 HSUSB EHCI External hub disconnect failure
To:     Linux-OMAP <linux-omap@vger.kernel.org>, lee@kernel.org,
        Tony Lindgren <tony@atomide.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

I have an AM3517 and it's using the ti,ehci-omap driver to control a
HS USB port.

I can connect and disconnect multiple devices without issue, but if I
connect and disconnect an external USB hub, the hub disconnection
isn't detected, and the USB no longer works when I connect anything.

I was wondering if anyone else has seen this and/or has any
suggestions on what I can try.  I should note, that I'm seeing this
ont he 6.1 LTS branch, and I haven't had time to check the latest, but
this driver is mature, and hasn't undergone any significant changes
since 6.1.

I also will try an OMAP35 and DM37 connected the same way to see if
the problem persists on those platforms.

thanks for any advice in advance.

adam

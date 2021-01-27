Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BEF75306208
	for <lists+linux-omap@lfdr.de>; Wed, 27 Jan 2021 18:31:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236192AbhA0Rat (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 27 Jan 2021 12:30:49 -0500
Received: from Galois.linutronix.de ([193.142.43.55]:57756 "EHLO
        galois.linutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235978AbhA0RaA (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Wed, 27 Jan 2021 12:30:00 -0500
From:   Sebastian Andrzej Siewior <bigeasy@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
        s=2020; t=1611768552;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding;
        bh=cN2Z9LvCGTTOhizcUgJh03KpxedivXPDN0q6QKgYWQY=;
        b=2vF0dK5CfuRvKFBgKucLK7ObsPGrmjeXD+7Bb0KTfL0bYVsdMpH0YLJ1310sxfcXsbTEML
        Q+vgYIF/gs0C0ZbpayCwZ3M4n1yHsySDbDJ2miL/A0AmtX1dt8t/LmXvIQpjzkkk8TSKNc
        6ZrkGLvx9KanW3790a98ngFJ64wac9fGzDATX/+Qxc/KiQ1OOxXH9IooPrKwZgpzOyS6av
        i6zgU8RXTpcMMIXTz1qzjmgtXlW5kKkCsRNtrdSmljVSEMM0J6UmxMqxFeutTBQxCIVQlp
        xosN6TtDEWuy2a9RiRWfeMwtSaWf7FyBOyuh6ekah2E6UtkGUwf4THN9Jvx2YQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
        s=2020e; t=1611768552;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding;
        bh=cN2Z9LvCGTTOhizcUgJh03KpxedivXPDN0q6QKgYWQY=;
        b=MWfwVJGOtV0YLFJd2H3hxYas73+1SxUPwMZJxDCSuaWl11/XkjpK9DYLNszUPOzLPhBHBc
        NFb9w0xh+M9jwBCQ==
To:     linux-omap@vger.kernel.org
Cc:     linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
        Thomas Gleixner <tglx@linutronix.de>
Subject: [PATCH 0/2] video: omap*: Remove in_interrupt() usage.
Date:   Wed, 27 Jan 2021 18:29:00 +0100
Message-Id: <20210127172902.145335-1-bigeasy@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Folks,

in the discussion about preempt count consistency across kernel
configurations:

 https://lore.kernel.org/r/20200914204209.256266093@linutronix.de/

it was concluded that the usage of in_interrupt() and related context
checks should be removed from non-core code.

In the long run, usage of 'preemptible, in_*irq etc.' should be banned from
driver code completely.

This series targets the video subsystem.

Sebastian

